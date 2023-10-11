//
//  VrtcalAdaptersWrapperParent.swift
//  Vrtcal-Adapters-Wrapper-Parent
//
//  Created by Scott McCoy on 10/10/23.
//

import Foundation

public class VrtcalAdaptersWrapperParent {
    
    let adapterWrappers: [AdapterWrapperProtocol]
    
    public init(
        appLogger: Logger,
        sdkEventsLogger: Logger,
        delegate: AdapterWrapperDelegate
    ) {
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
    
    // customEventClass = customEventClass as? VRTAbstractCustomEvent.Type
}
