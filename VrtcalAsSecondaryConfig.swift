//
//  VrtcalAsSecondaryConfig.swift
//  Vrtcal-Adapters-Wrapper-Parent
//
//  Created by Scott McCoy on 10/10/23.
//

public struct VrtcalAsSecondaryConfig {
    
    public enum ThirdParty {
        case appLovin
        case googleMobileAds
        case ironSource
        case smaato
        case tapjoy
    }
    
    public enum PlacementType {
        case banner
        case interstitial
        case rewardedVideo
        case showDebugView
    }
    
    public let name: String
    public let thirdParty:ThirdParty
    public let placementType:PlacementType
    public let adUnitId:String
}
