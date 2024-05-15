public enum AdTechConfigProvider: CaseIterable {
    
    // MARK: Vrtcal Solo
    case vrtcalSoloBanner
    case vrtcalSoloInterstitial
    case vrtcalToAdMobBanner
    case vrtcalToAdMobInterstitial

    // MARK: Vrtcal to AppLovin
    case vrtcalToAppLovinBannerVita
    case vrtcalToAppLovinInterstitialVita
    case vrtcalToAppLovinBannerTwitMore
    case vrtcalToAppLovinInterstitialTwitMore
    
    // MARK: Vrtcal to Fyber FairBid
    // Note: vrtcalToFyberFairBidBanner is missing because their banners attach to the window
    case vrtcalToFyberFairBidInterstitial
    
    // MARK: Vrtcal to Fyber Marketplace
    case vrtcalToFyberMarketplaceBanner
    case vrtcalToFyberMarketplaceInterstitial
    
    // MARK: Vrtcal to IronSource
    // Note: vrtcalToIronSourceBanner is missing because their banners attach to the window
    case vrtcalToIronSourceInterstitial
    
    // MARK: Vrtcal to Smaato
    case vrtcalToSmaatoBanner
    case vrtcalToSmaatoInterstitial
    
    // MARK: Vrtcal to TapJoy
    case vrtcalToTapjoyInterstitial
    
    // MARK: Vrtcal to Vungle
    case vrtcalToVungleBanner
    case vrtcalToVungleInterstitial

    // MARK: AdMob to Vrtcal
    // At the time of this writing, adMob, Applovin and IronSource are the only VrtAsSecondary adapters
    case adMobToVrtcalBanner
    case adMobToVrtcalInterstitial
    
    // MARK: AppLovin to Vrtcal
    case appLovinToVrtcalBannerVita
    case appLovinToVrtcalInterstitialVita
    case appLovinToVrtcalBannerTwitMore
    case appLovinToVrtcalInterstitialTwitMore
    case appLovinDebugView

    // MARK: IronSource to Vrtcal
    case ironSourceToVrtcalInterstitial
    case ironSourceToVrtcalRewardedVideo
    
    // MARK: Smaato Solo
    // Smaato does not support mediation with them as primary
    case smaatoSoloBanner
    case smaatoSoloInterstitial
    
    // MARK: TapJoy Solo
    // TapJoy does not support mediation with them as primary
    case tapjoySoloInterstitial

    static public var allCasesCurrentApp: [AdTechConfig] {
        
        switch App.current {
            
        case .vita:
            return allCases
                .map {
                    $0.adTechConfig
                }
                // Only show vrtcal as secondary since the test server covers all the vrtcal as primary ones
                .filter {
                    $0.secondarySdk == .vrtcal || $0.placementType == .showDebugView
                }
                .filter {
                    $0.appRestriction == .vita || $0.appRestriction == .none
                }
        case .twitMore:
            return allCases
                .map {
                    $0.adTechConfig
                }
                .filter {
                    $0.appRestriction == .twitMore || $0.appRestriction == .none
                }
            
        case .none:
            return allCases
                .map {
                    $0.adTechConfig
                }
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

        case .vrtcalToAppLovinBannerTwitMore:
            return AdTechConfig(
                appRestriction: .twitMore,
                primarySdk: .vrtcal,
                secondarySdk: .appLovin,
                placementType: .banner,
                adUnitId: "10399",
                secondaryAdUnitId: "e57095ed15a96c51"
            )
        
        case .vrtcalToAppLovinInterstitialTwitMore:
            return AdTechConfig(
                appRestriction: .twitMore,
                primarySdk: .vrtcal,
                secondarySdk: .appLovin,
                placementType: .interstitial,
                adUnitId: "10407",
                secondaryAdUnitId: "e61b109e4aaca615"
            )

        case .vrtcalToAppLovinBannerVita:
            return AdTechConfig(
                appRestriction: .vita,
                primarySdk: .vrtcal,
                secondarySdk: .appLovin,
                placementType: .banner,
                adUnitId: "600",
                secondaryAdUnitId: "beebcd33121f3165"
            )
        
        case .vrtcalToAppLovinInterstitialVita:
            return AdTechConfig(
                appRestriction: .vita,
                primarySdk: .vrtcal,
                secondarySdk: .appLovin,
                placementType: .interstitial,
                adUnitId: "601",
                secondaryAdUnitId: "3f3863cbf96a7b69"
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
        case .appLovinToVrtcalBannerVita:
            return AdTechConfig(
                appRestriction: .vita,
                primarySdk: .appLovin,
                secondarySdk: .vrtcal,
                placementType: .banner,
                adUnitId: "0bbf2c625c63e29f"
            )
        
        case .appLovinToVrtcalBannerTwitMore:
            return AdTechConfig(
                appRestriction: .twitMore,
                primarySdk: .appLovin,
                secondarySdk: .vrtcal,
                placementType: .banner,
                adUnitId: "5829eda19b37d9bf"
            )
            
        case .appLovinToVrtcalInterstitialVita:
            return AdTechConfig(
                appRestriction: .vita,
                primarySdk: .appLovin,
                secondarySdk: .vrtcal,
                placementType: .interstitial,
                adUnitId: "47f3a9b0433d25a4"
            )
            
        case .appLovinToVrtcalInterstitialTwitMore:
            return AdTechConfig(
                appRestriction: .twitMore,
                primarySdk: .appLovin,
                secondarySdk: .vrtcal,
                placementType: .interstitial,
                adUnitId: "326922ce65d27ad1"
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
