public enum AdTechConfigProvider: CaseIterable {
    
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
    
    case smaatoSoloBanner
    case smaatoSoloInterstitial
    
    case tapjoySoloInterstitial

    static public var allCasesVrtcalAsSecondary: [AdTechConfig] {
        allCases
        .map {
            $0.adTechConfig
        }
        .filter {
            $0.secondarySdk == .vrtcal
        }
    }
    
    // Third Party Adapter Doc:
    // https://docs.google.com/spreadsheets/d/1jy4-TS7HwSypUWtgEyV0SS3-Rt2Jv4UvKNR8upH-GHA/edit
    public var adTechConfig: AdTechConfig {
        switch self {
            
        // MARK: Vrtcal
        case .vrtcalSoloBanner:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .none,
                placementType: .banner,
                adUnitId: "10005"
            )
        
        case .vrtcalSoloInterstitial:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .none,
                placementType: .interstitial,
                adUnitId: "10009"
            )

        case .vrtcalToAdMobBanner:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .adMob,
                placementType: .banner,
                adUnitId: "10231"
            )

        case .vrtcalToAdMobInterstitial:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .adMob,
                placementType: .interstitial,
                adUnitId: "10232"
            )

        case .vrtcalToAppLovinBanner:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .appLovin,
                placementType: .banner,
                adUnitId: "10399"
            )
        
        case .vrtcalToAppLovinInterstitial:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .appLovin,
                placementType: .interstitial,
                adUnitId: "10407"
            )
        
        case .vrtcalToFyberFairBidInterstitial:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .fyberFairbid,
                placementType: .interstitial,
                adUnitId: "10418"
            )
            
        case .vrtcalToFyberMarketplaceBanner:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .fyberMarketplace,
                placementType: .banner,
                adUnitId: "10419"
            )
            
        case .vrtcalToFyberMarketplaceInterstitial:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .fyberMarketplace,
                placementType: .interstitial,
                adUnitId: "10420"
            )
            
        case .vrtcalToIronSourceInterstitial:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .ironSource,
                placementType: .interstitial,
                adUnitId: "10417"
            )
            
        case .vrtcalToSmaatoBanner:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .smaato,
                placementType: .banner,
                adUnitId: "10498"
            )
            
        case .vrtcalToSmaatoInterstitial:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .smaato,
                placementType: .interstitial,
                adUnitId: "10499"
            )
            
        case .vrtcalToTapjoyInterstitial:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .tapjoy,
                placementType: .interstitial,
                adUnitId: "10502"
            )
            
        case .vrtcalToVungleBanner:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .vungle,
                placementType: .banner,
                adUnitId: "10478"
            )
            
        case .vrtcalToVungleInterstitial:
            return AdTechConfig(
                primarySdk: .vrtcal,
                secondarySdk: .vungle,
                placementType: .interstitial,
                adUnitId: "10501"
            )
            
        // MARK: AdMob
        case .adMobToVrtcalBanner:
            return AdTechConfig(
                primarySdk: .adMob,
                secondarySdk: .vrtcal,
                placementType: .banner,
                adUnitId: "ca-app-pub-9576567786990145/7712119624"
            )
            
        case .adMobToVrtcalInterstitial:
            return AdTechConfig(
                primarySdk: .adMob,
                secondarySdk: .vrtcal,
                placementType: .interstitial,
                adUnitId: "ca-app-pub-9576567786990145/2025798230"
            )
            
        // MARK: AppLovin
        case .appLovinToVrtcalBanner:
            return AdTechConfig(
                primarySdk: .appLovin,
                secondarySdk: .vrtcal,
                placementType: .banner,
                adUnitId: "0bbf2c625c63e29f"
            )
            
        case .appLovinToVrtcalInterstitial:
            return AdTechConfig(
                primarySdk: .appLovin,
                secondarySdk: .vrtcal,
                placementType: .interstitial,
                adUnitId: "47f3a9b0433d25a4"
            )
            
        case .appLovinDebugView:
            return AdTechConfig(
                primarySdk: .appLovin,
                secondarySdk: .none,
                placementType: .showDebugView,
                adUnitId: ""
            )
            

            
        // MARK: IronSource
        case .ironSourceToVrtcalInterstitial:
            return AdTechConfig(
                primarySdk: .ironSource,
                secondarySdk: .vrtcal,
                placementType: .interstitial,
                adUnitId: "556d9907930e44b492158fef75f8724b"
            )

        case .ironSourceToVrtcalRewardedVideo:
            return AdTechConfig(
                primarySdk: .ironSource,
                secondarySdk: .vrtcal,
                placementType: .rewardedVideo,
                adUnitId: ""
            )
            
            
        // MARK: Smaato
        // Ad unit IDs from https://developers.smaato.com/publishers/nextgen-sdk-ios-integration/
        case .smaatoSoloBanner:
            return AdTechConfig(
                primarySdk: .smaato,
                secondarySdk: .none,
                placementType: .banner,
                adUnitId: "130626424"
            )

        case .smaatoSoloInterstitial:
            return AdTechConfig(
                primarySdk: .smaato,
                secondarySdk: .none,
                placementType: .interstitial,
                adUnitId: "130626426"
            )
        
        // MARK: Tapjoy
        case .tapjoySoloInterstitial:
            return AdTechConfig(
                primarySdk: .tapjoy,
                secondarySdk: .none,
                placementType: .interstitial,
                adUnitId: "QA CORE Interstitial iOS Local"
            )
        }
    }
}


extension AdTechConfigProvider: CustomStringConvertible {
    public var description: String {
        return adTechConfig.name
    }
}
