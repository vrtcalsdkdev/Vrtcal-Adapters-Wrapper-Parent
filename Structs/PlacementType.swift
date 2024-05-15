//
//  AdTechConfig.swift
//  Vrtcal-Adapters-Wrapper-Parent
//
//  Created by Scott McCoy on 10/10/23.
//

public enum PlacementType: CaseIterable, CustomStringConvertible {
    case banner
    case interstitial
    case rewardedVideo
    case showDebugView
    
    public var description: String {
        switch self {
        case .banner: return "Banner"
        case .interstitial: return "Interstitial"
        case .rewardedVideo: return "Rewarded Video"
        case .showDebugView: return "Show Debug View"
        }
    }
}
