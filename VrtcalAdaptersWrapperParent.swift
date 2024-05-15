//
//  VrtcalAdaptersWrapperParent.swift
//  Vrtcal-Adapters-Wrapper-Parent
//
//  Created by Scott McCoy on 10/10/23.
//

import Foundation

public class VrtcalAdaptersWrapperParent {
    
    var appLogger: Logger
    var sdkEventsLogger: Logger
    
    var initializeAllSdksOnceHasRun = false
    
    /// List of adapters included via cocoapods and fetched using ProtocolImplementationFinder
    public let adapterWrappers: [AdapterWrapperProtocol]

    /// List of available SDKs
    public lazy var sdks: [SDK] = {
        var sdks = adapterWrappers.map {
            $0.sdk
        }.sorted { (lhs: SDK, rhs: SDK) in
            lhs.description < rhs.description
        }
        
        return sdks
    }()
    
    public init(
        appLogger: Logger,
        sdkEventsLogger: Logger,
        delegate: AdapterWrapperDelegate
    ) {
        self.appLogger = appLogger
        self.sdkEventsLogger = sdkEventsLogger
        
        // Print Adapter versions from Podfile.lock
        if let path = Bundle.main.path(forResource: "Podfile.lock", ofType: nil),
        let contents = try? String(contentsOfFile: path) {
            
            let filtered = contents.split(separator: "\n")
                .filter {
                    $0.contains("- Vrtcal-") && 
                    $0.contains("-Adapters") &&
                    $0.contains(":") &&
                    !$0.contains("Wrapper")
                }
                .joined(separator: "\n")
            
            
            appLogger.log("Adapters: \n\(filtered)")
        } else {
            appLogger.log("Could not get Podfile.lock")
        }
        
        // Initialize Adapter Wrappers
        adapterWrappers = ProtocolImplementationFinder.adapterWrapperTypes().map {
            appLogger.log("Initializing wrapper \($0)")

            return $0.init(
                appLogger: appLogger,
                sdkEventsLogger: sdkEventsLogger,
                delegate: delegate
            )
        }
    }
    
    public func initialize(sdk: SDK) {
        guard let adapterWrapper = adapterWrappers.first(where: {
            $0.sdk == sdk
        }) else {
            sdkEventsLogger.log("SDK not found, can't initialize: \(sdk)")
            return
        }
        sdkEventsLogger.log("Initializing \(sdk) Adapter Wrapper...")
        adapterWrapper.initializeSdk()
    }
    
    public func initializeAllSdksOnce() {
        guard !initializeAllSdksOnceHasRun else {
            return
        }
        initializeAllSdksOnceHasRun = true
        sdks.forEach {
            initialize(sdk: $0)
        }
    }
    
    public func mediate(adTechConfig: AdTechConfig) {
        guard let adapterWrapper = adapterWrappers.first(where: {
            $0.sdk == adTechConfig.primarySdk
        }) else {
            sdkEventsLogger.log("SDK not found, can't mediate: \(adTechConfig.primarySdk)")
            return
        }
        
        adapterWrapper.handle(adTechConfig: adTechConfig)
    }
    
    @discardableResult
    public func showInterstitial() -> Bool {
        for adapterWrapper in adapterWrappers {
            appLogger.log("Checking \(adapterWrapper.sdk) for interstitial...")
            if adapterWrapper.showInterstitial() {
                appLogger.log("\(adapterWrapper.sdk) showed an interstitial")
                return true
            }
        }
        
        return false
    }
    
    public func destroyInterstitial() {
        adapterWrappers.forEach {
            $0.destroyInterstitial()
        }
    }
}
