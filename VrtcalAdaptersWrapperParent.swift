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
    
    
    /// List of adapters included via cocoapods
    public let adapterWrappers: [AdapterWrapperProtocol]

    // TODO: Make Vrtcal be its own Adapter Wrapper
    /// List of available SDKs -  forcibly includes Vrtcal.
    public lazy var sdks: [SDK] = {
        var sdks = adapterWrappers.map {
            $0.sdk
        }.sorted {
            $0.rawValue < $1.rawValue
        }
        
        sdks.insert(.vrtcal, at: 0)
        
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
        sdkEventsLogger.log("Initializing \(sdk)...")
        adapterWrapper.initializeSdk()
    }
    
    public func mediate(vrtcalAsSecondaryConfig: VrtcalAsSecondaryConfig) {
        guard let adapterWrapper = adapterWrappers.first(where: {
            $0.sdk == vrtcalAsSecondaryConfig.primarySdk
        }) else {
            sdkEventsLogger.log("SDK not found, can't mediate: \(vrtcalAsSecondaryConfig.primarySdk)")
            return
        }
        
        adapterWrapper.handle(vrtcalAsSecondaryConfig: vrtcalAsSecondaryConfig)
    }
    
    public func showInterstitial() -> Bool {
        for adapterWrapper in adapterWrappers {
            if adapterWrapper.showInterstitial() {
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
