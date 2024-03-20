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

    // TODO: Make Vrtcal be its own Adapter Wrapper
    /// List of available SDKs -  forcibly includes Vrtcal.
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
        
        let protocolImplementationFinder = ProtocolImplementationFinder()
        
        adapterWrappers = protocolImplementationFinder.allClasses.compactMap {
            guard let adapterWrapperType = $0.self as? AdapterWrapperProtocol.Type else {
                return nil
            }
            
            return adapterWrapperType.init(
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
