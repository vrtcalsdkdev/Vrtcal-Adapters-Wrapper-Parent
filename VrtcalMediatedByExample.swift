//
//  MAAdDelegatePassthrough.swift
//  Vrtcal-AppLovin-Adapters
//
//  Created by Scott McCoy on 9/15/23.
//

public enum VrtcalMediatedByExample : String, CaseIterable {
    
    case appLovinBannerBasic = "AppLovin Banner Basic"
//    case appLovinBannerMraidResize = "AppLovin Banner Mraid Resize"
//    case appLovinBannerMraidExpand = "AppLovin Banner Mraid Expand"
//    case appLovinBannerVrtcalFailsToLoad = "AppLovin Banner Vrtcal Fails To Load"
//    case appLovinBannerUnusableZoneId = "AppLovin Banner Unusable Zone Id"
//    case appLovinBannerVideo = "AppLovin Banner Video"
    
    case appLovinInterstitialBasic = "AppLovin Interstitial Basic"
//    case appLovinInterstitialMraidVideo = "AppLovin Interstitial Mraid Video"
//    case appLovinInterstitialVrtcalFailsToLoad = "AppLovin Interstitial Vrtcal Fails To Load"
//    case appLovinInterstitialUnsuableZoneId = "AppLovin Interstitial Vrtcal Unusable Zone Id"
//    case appLovinInterstitialVideo = "AppLovin Interstitial Video"
    
    case appLovinDebugView = "AppLovin Debug View"
    
    case googleMobileAdsBanner = "GMA Banner"
    case googleMobileAdsInterstitial = "GMA Interstitial"
    
    //case ironSourceBanner = "IronSource Banner"
    case ironSourceInterstitial = "IronSource Interstitial"
    case ironSourceRewardedVideo = "IronSource Rewarded Video"
    
    case smaatoBanner = "Smaato Banner"
    case smaatoInterstitial = "Smaato Interstitial"
    
    case tapjoyInterstitial = "Tapjoy Interstitial"
    
    //Third Party Adapter Doc:
    //https://docs.google.com/spreadsheets/d/1jy4-TS7HwSypUWtgEyV0SS3-Rt2Jv4UvKNR8upH-GHA/edit
    public var data : VrtcalAsSecondaryConfig {
        switch self {
            case .appLovinBannerBasic:
                return VrtcalAsSecondaryConfig(
                    name: self.rawValue,
                    primarySdk: .appLovin,
                    placementType: .banner,
                    adUnitId: "0bbf2c625c63e29f"
                )
                
//            case .appLovinBannerMraidResize:
//                <#code#>
//            case .appLovinBannerMraidExpand:
//                <#code#>
//            case .appLovinBannerVrtcalFailsToLoad:
//                <#code#>
//            case .appLovinBannerUnusableZoneId:
//                <#code#>
//            case .appLovinBannerVideo:
//                <#code#>
                
            case .appLovinDebugView:
                return VrtcalAsSecondaryConfig(
                    name: self.rawValue,
                    primarySdk: .appLovin,
                    placementType: .showDebugView,
                    adUnitId: ""
                )
                
            case .appLovinInterstitialBasic:
                return VrtcalAsSecondaryConfig(
                    name: self.rawValue,
                    primarySdk: .appLovin,
                    placementType: .interstitial,
                    adUnitId: "47f3a9b0433d25a4"
                )
                
//            case .appLovinInterstitialMraidVideo:
//                <#code#>
//            case .appLovinInterstitialVrtcalFailsToLoad:
//                <#code#>
//            case .appLovinInterstitialUnsuableZoneId:
//                <#code#>
//            case .appLovinInterstitialVideo:
//                <#code#>
                
            //MARK: GMA
            case .googleMobileAdsBanner:
                return VrtcalAsSecondaryConfig(
                    name: self.rawValue,
                    primarySdk: .googleMobileAds,
                    placementType: .banner,
                    adUnitId: "ca-app-pub-9576567786990145/7712119624"
                )
                
            case .googleMobileAdsInterstitial:
                return VrtcalAsSecondaryConfig(
                    name: self.rawValue,
                    primarySdk: .googleMobileAds,
                    placementType: .interstitial,
                    adUnitId: "ca-app-pub-9576567786990145/2025798230"
                )
                
            
            //MARK: IronSource
            case .ironSourceInterstitial:
                return VrtcalAsSecondaryConfig(
                    name: self.rawValue,
                    primarySdk: .ironSource,
                    placementType: .interstitial,
                    adUnitId: "556d9907930e44b492158fef75f8724b"
                )
                
            //IronSource doesn't support banner mediation
            //    VrtcalMediatedByExample(
            //        name: self.rawValue,
            //        thirdParty: .ironSource,
            //        placementType: .banner,
            //        adUnitId: ""
            //    )
                
            case .ironSourceRewardedVideo:
                return VrtcalAsSecondaryConfig(
                    name: self.rawValue,
                    primarySdk: .ironSource,
                    placementType: .rewardedVideo,
                    adUnitId: ""
                )
                
                
            //MARK: Smaato
            //Ad unit IDs from https://developers.smaato.com/publishers/nextgen-sdk-ios-integration/
            case .smaatoBanner:
                return VrtcalAsSecondaryConfig(
                    name: self.rawValue,
                    primarySdk: .smaato,
                    placementType: .banner,
                    adUnitId: "130626424"
                )

            case .smaatoInterstitial:
                return VrtcalAsSecondaryConfig(
                    name: self.rawValue,
                    primarySdk: .smaato,
                    placementType: .interstitial,
                    adUnitId: "130626426"
                )
                
            case .tapjoyInterstitial:
                return VrtcalAsSecondaryConfig(
                    name: self.rawValue,
                    primarySdk: .tapjoy,
                    placementType: .interstitial,
                    adUnitId: "QA CORE Interstitial iOS Local"
                )
        }
    }
}
