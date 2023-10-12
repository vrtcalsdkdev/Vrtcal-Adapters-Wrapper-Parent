//
//  VrtcalAsSecondaryConfig.swift
//  Vrtcal-Adapters-Wrapper-Parent
//
//  Created by Scott McCoy on 10/10/23.
//

public enum PlacementType {
    case banner
    case interstitial
    case rewardedVideo
    case showDebugView
}


public struct VrtcalAsSecondaryConfig {
    public let name: String
    public let primarySdk: SDK
    public let placementType: PlacementType
    public let adUnitId: String
}
