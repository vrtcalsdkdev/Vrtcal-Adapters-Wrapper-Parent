//
//  Protocols.swift
//  Vrtcal-Adapters-Wrapper-Parent
//
//  Created by Scott McCoy on 10/10/23.
//

import Foundation



public protocol AdapterWrapperProtocol {
    init (
        appLogger: Logger,
        sdkEventsLogger: Logger,
        delegate: AdapterWrapperDelegate
    )
    
    var sdk: SDK { get }
    
    func initializeSdk()
    func handle(vrtcalAsSecondaryConfig: VrtcalAsSecondaryConfig)
    func showInterstitial() -> Bool
    func destroyInterstitial()
}

public protocol AdapterWrapperDelegate {
    var viewController: UIViewController { get }
    var isSimulator: Bool { get }

    func provide(banner: UIView)
}
