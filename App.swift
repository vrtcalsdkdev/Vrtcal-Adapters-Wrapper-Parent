//
//  App.swift
//  Vrtcal-Adapters-Wrapper-Parent
//
//  Created by Scott McCoy on 3/7/24.
//

import Foundation

public enum App: String {
    case none
    case vita
    case twitMore
    
    static var current: App {
        switch Bundle.main.bundleIdentifier {
            case "com.vrtcal.VrtcalSDKInternalTestApp":
                return .vita
                
            case "com.vrtcal.TwitMore":
                return .twitMore
                
            default:
                return .none
        }
    }
}
