public enum AdTechConfigProvider: CaseIterable, CustomStringConvertible {
    
    case vrtcalSoloBanner
    case vrtcalSoloInterstitial
    case vrtcalToAdMobBanner
    case vrtcalToAdMobInterstitial
    case vrtcalToAppLovinBanner
    case vrtcalToAppLovinInterstitial
    // Note: vrtcalToFyberFairBidBanner is missing because their banners attach to the window
    case vrtcalToFyberFairBidInterstitial
    case vrtcalToFyberMarketplaceBanner
    case vrtcalToFyberMarketplaceInterstitial
    // Note: vrtcalToIronSourceBanner is missing because their banners attach to the window
    case vrtcalToIronSourceInterstitial
    case vrtcalToSmaatoBanner
    case vrtcalToSmaatoInterstitial
    case vrtcalToTapjoyInterstitial
    case vrtcalToVungleBanner
    case vrtcalToVungleInterstitial

    
    // At the time of this writing, adMob, Applovin and IronSource are the only VrtAsSecondary adapters
    case adMobToVrtcalBanner
    case adMobToVrtcalInterstitial
    
    case appLovinToVrtcalBanner
    case appLovinToVrtcalInterstitial
    case appLovinDebugView

    case ironSourceToVrtcalInterstitial
    case ironSourceToVrtcalRewardedVideo
    
    case smaatofimerSoloBanner
    case smaatoSoloInterstitial
    
    case tapjoySoloInterstitial
    
    public var description: String {
        return adTechConfig.name
    }
    
    // Third Party Adapter Doc:
    // https://docs.google.com/spreadsheets/d/1jy4-TS7HwSypUWtgEyV0SS3-Rt2Jv4UvKNR8upH-GHA/edit
    public var adTechConfig: AdTechConfig {
        switch self {
            
        // MARK: Vrtcal
        case .vrtcalSoloBanner:
            return AdTechConfig(
                name: "Vrtcal Solo Banner",
                primarySdk: .vrtcal,
                secondarySDK: .none,
                placementType: .banner,
                adUnitId: "10005"
            )
        
        case .vrtcalSoloInterstitial:
            return AdTechConfig(
                name: "Vrtcal Solo Interstitial",
                primarySdk: .vrtcal,
                secondarySDK: .none,
                placementType: .interstitial,
                adUnitId: "10009"
            )

        case .vrtcalToAdMobBanner:
            return AdTechConfig(
                name: "Vrtcal to AdMob Banner",
                primarySdk: .vrtcal,
                secondarySDK: .adMob,
                placementType: .banner,
                adUnitId: "10231"
            )

        case .vrtcalToAdMobInterstitial:
            return AdTechConfig(
                name: "Vrtcal to AdMob Interstitial",
                primarySdk: .vrtcal,
                secondarySDK: .adMob,
                placementType: .interstitial,
                adUnitId: "10232"
            )

        case .vrtcalToAppLovinBanner:
            return AdTechConfig(
                name: "Vrtcal to AppLovin Banner",
                primarySdk: .vrtcal,
                secondarySDK: .appLovin,
                placementType: .banner,
                adUnitId: "10399"
            )
        
        case .vrtcalToAppLovinInterstitial:
            return AdTechConfig(
                name: "Vrtcal to AppLovin Interstitial",
                primarySdk: .vrtcal,
                secondarySDK: .appLovin,
                placementType: .interstitial,
                adUnitId: "10407"
            )
        
        case .vrtcalToFyberFairBidInterstitial:
            return AdTechConfig(
                name: "Vrtcal to AppLovin Interstitial",
                primarySdk: .vrtcal,
                secondarySDK: .fyberFairbid,
                placementType: .interstitial,
                adUnitId: "10418"
            )
            
        case .vrtcalToFyberMarketplaceBanner:
            return AdTechConfig(
                name: "Vrtcal to Fyber Marketplace Banner",
                primarySdk: .vrtcal,
                secondarySDK: .fyberMarketplace,
                placementType: .banner,
                adUnitId: "10419"
            )
            
        case .vrtcalToFyberMarketplaceInterstitial:
            return AdTechConfig(
                name: "Vrtcal to Fyber Marketplace Interstitial",
                primarySdk: .vrtcal,
                secondarySDK: .fyberMarketplace,
                placementType: .interstitial,
                adUnitId: "10420"
            )
            
        case .vrtcalToIronSourceInterstitial:
            return AdTechConfig(
                name: "Vrtcal to Fyber Marketplace Interstitial",
                primarySdk: .vrtcal,
                secondarySDK: .fyberMarketplace,
                placementType: .interstitial,
                adUnitId: "10417"
            )
            
        case .vrtcalToSmaatoBanner:
            return AdTechConfig(
                name: "Vrtcal to Smaato Banner",
                primarySdk: .vrtcal,
                secondarySDK: .smaato,
                placementType: .banner,
                adUnitId: "10498"
            )
            
        case .vrtcalToSmaatoInterstitial:
            return AdTechConfig(
                name: "Vrtcal to Smaato Interstitial",
                primarySdk: .vrtcal,
                secondarySDK: .smaato,
                placementType: .interstitial,
                adUnitId: "10499"
            )
            
        case .vrtcalToTapjoyInterstitial:
            return AdTechConfig(
                name: "Vrtcal to Tapjoy Interstitial",
                primarySdk: .vrtcal,
                secondarySDK: .tapjoy,
                placementType: .interstitial,
                adUnitId: "10502"
            )
            
        case .vrtcalToVungleBanner:
            return AdTechConfig(
                name: "Vrtcal to Vungle Banner",
                primarySdk: .vrtcal,
                secondarySDK: .vungle,
                placementType: .banner,
                adUnitId: "10478"
            )
            
        case .vrtcalToVungleInterstitial:
            return AdTechConfig(
                name: "Vrtcal to Vungle Interstitial",
                primarySdk: .vrtcal,
                secondarySDK: .vungle,
                placementType: .interstitial,
                adUnitId: "10501"
            )
            
        // MARK: AdMob
        case .adMobToVrtcalBanner:
            return AdTechConfig(
                name: "AdMob to Vrtcal Banner",
                primarySdk: .adMob,
                secondarySDK: .vrtcal,
                placementType: .banner,
                adUnitId: "ca-app-pub-9576567786990145/7712119624"
            )
            
        case .adMobToVrtcalInterstitial:
            return AdTechConfig(
                name: "AdMob to Vrtcal Interstitial",
                primarySdk: .adMob,
                secondarySDK: .vrtcal,
                placementType: .interstitial,
                adUnitId: "ca-app-pub-9576567786990145/2025798230"
            )
            
        // MARK: AppLovin
        case .appLovinToVrtcalBanner:
            return AdTechConfig(
                name: "AppLovin to Vrtcal Banner",
                primarySdk: .appLovin,
                secondarySDK: .vrtcal,
                placementType: .banner,
                adUnitId: "0bbf2c625c63e29f"
            )
            
        case .appLovinToVrtcalInterstitial:
            return AdTechConfig(
                name: "AppLovin to Vrtcal Interstitial",
                primarySdk: .appLovin,
                secondarySDK: .vrtcal,
                placementType: .interstitial,
                adUnitId: "47f3a9b0433d25a4"
            )
            
        case .appLovinDebugView:
            return AdTechConfig(
                name: "AppLovin Debug View",
                primarySdk: .appLovin,
                secondarySDK: .none,
                placementType: .showDebugView,
                adUnitId: ""
            )
            

            
        // MARK: IronSource
        case .ironSourceToVrtcalInterstitial:
            return AdTechConfig(
                name: "IronSource to Vrtcal Interstitial",
                primarySdk: .ironSource,
                secondarySDK: .vrtcal,
                placementType: .interstitial,
                adUnitId: "556d9907930e44b492158fef75f8724b"
            )

        case .ironSourceToVrtcalRewardedVideo:
            return AdTechConfig(
                name: "IronSource to Vrtcal Rewarded Video",
                primarySdk: .ironSource,
                secondarySDK: .vrtcal,
                placementType: .rewardedVideo,
                adUnitId: ""
            )
            
            
        // MARK: Smaato
        // Ad unit IDs from https://developers.smaato.com/publishers/nextgen-sdk-ios-integration/
        case .smaatoSoloBanner:
            return AdTechConfig(
                name: "Smaato Solo Banner",
                primarySdk: .smaato,
                secondarySDK: .none,
                placementType: .banner,
                adUnitId: "130626424"
            )

        case .smaatoSoloInterstitial:
            return AdTechConfig(
                name: "Smaato Solo Interstitial",
                primarySdk: .smaato,
                secondarySDK: .none,
                placementType: .interstitial,
                adUnitId: "130626426"
            )
        
        // MARK: Tapjoy
        case .tapjoySoloInterstitial:
            return AdTechConfig(
                name: "Tapjoy Solo Interstitial",
                primarySdk: .tapjoy,
                secondarySDK: .none,
                placementType: .interstitial,
                adUnitId: "QA CORE Interstitial iOS Local"
            )

        }
    }
}
