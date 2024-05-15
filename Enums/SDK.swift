//
//  ThirdParty.swift
//  Vrtcal-Adapters-Wrapper-Parent
//
//  Created by Scott McCoy on 10/11/23.
//

import Foundation


public enum SDK: CaseIterable, CustomStringConvertible {
    case none
    case vrtcal
    case appLovin
    case fyberFairbid
    case fyberMarketplace
    case adMob
    case ironSource
    case smaato
    case tapjoy
    case vungle
    
    public var description: String {
        switch self {
        case .none: return "None"
        case .vrtcal: return "Vrtcal"
        case .appLovin: return "AppLovin"
        case .fyberFairbid: return "F. Fairbid"
        case .fyberMarketplace: return "F. Marketplace"
        case .adMob: return "GMA"
        case .ironSource: return "IS"
        case .smaato: return "Smaato"
        case .tapjoy: return "TJ"
        case .vungle: return "Vungle"
        }
    }
}
