public enum AdTechConfigProvider: CaseIterable {
    
    case appLovinToVrtcalBanner
    case appLovinToVrtcalInterstitial
    case appLovinDebugView
    
    case googleMobileAdsToVrtcalBanner
    case googleMobileAdsToVrtcalInterstitial
    
    case ironSourceToVrtcalInterstitial
    case ironSourceToVrtcalRewardedVideo
    
    case smaatoSoloBanner
    case smaatoSoloInterstitial
    
    case tapjoySoloInterstitial
    
    // Third Party Adapter Doc:
    // https://docs.google.com/spreadsheets/d/1jy4-TS7HwSypUWtgEyV0SS3-Rt2Jv4UvKNR8upH-GHA/edit
    public var adTechConfig: AdTechConfig {
        switch self {
                
            // MARK: AppLovin
            case .appLovinToVrtcalBanner:
                return AdTechConfig(
                    name: "AppLovin Banner Basic",
                    primarySdk: .appLovin,
                    secondarySDK: .vrtcal,
                    placementType: .banner,
                    adUnitId: "0bbf2c625c63e29f"
                )
                
            case .appLovinToVrtcalInterstitial:
                return AdTechConfig(
                    name: "AppLovin Interstitial Basic",
                    primarySdk: .appLovin,
                    secondarySDK: .vrtcal,
                    placementType: .interstitial,
                    adUnitId: "47f3a9b0433d25a4"
                )
                
            case .appLovinDebugView:
                return AdTechConfig(
                    name: "AppLovin Debug View",
                    primarySdk: .appLovin,
                    secondarySDK: .vrtcal,
                    placementType: .showDebugView,
                    adUnitId: ""
                )
                
            // MARK: GMA
            case .googleMobileAdsToVrtcalBanner:
                return AdTechConfig(
                    name: "GMA Banner",
                    primarySdk: .googleMobileAds,
                    secondarySDK: .vrtcal,
                    placementType: .banner,
                    adUnitId: "ca-app-pub-9576567786990145/7712119624"
                )
                
            case .googleMobileAdsToVrtcalInterstitial:
                return AdTechConfig(
                    name: "GMA Interstitial",
                    primarySdk: .googleMobileAds,
                    secondarySDK: .vrtcal,
                    placementType: .interstitial,
                    adUnitId: "ca-app-pub-9576567786990145/2025798230"
                )
                
            // MARK: IronSource
            case .ironSourceToVrtcalInterstitial:
                return AdTechConfig(
                    name: "IronSource Interstitial",
                    primarySdk: .ironSource,
                    secondarySDK: .vrtcal,
                    placementType: .interstitial,
                    adUnitId: "556d9907930e44b492158fef75f8724b"
                )

            case .ironSourceToVrtcalRewardedVideo:
                return AdTechConfig(
                    name: "IronSource Rewarded Video",
                    primarySdk: .ironSource,
                    secondarySDK: .vrtcal,
                    placementType: .rewardedVideo,
                    adUnitId: ""
                )
                
                
            // MARK: Smaato
            // Ad unit IDs from https://developers.smaato.com/publishers/nextgen-sdk-ios-integration/
            case .smaatoSoloBanner:
                return AdTechConfig(
                    name: "Smaato Banner",
                    primarySdk: .smaato,
                    secondarySDK: nil,
                    placementType: .banner,
                    adUnitId: "130626424"
                )

            case .smaatoSoloInterstitial:
                return AdTechConfig(
                    name: "Smaato Interstitial",
                    primarySdk: .smaato,
                    secondarySDK: nil,
                    placementType: .interstitial,
                    adUnitId: "130626426"
                )
            // MARK: Tapjoy
            case .tapjoySoloInterstitial:
                return AdTechConfig(
                    name: "Tapjoy Interstitial",
                    primarySdk: .tapjoy,
                    secondarySDK: nil,
                    placementType: .interstitial,
                    adUnitId: "QA CORE Interstitial iOS Local"
                )
        }
    }
}
