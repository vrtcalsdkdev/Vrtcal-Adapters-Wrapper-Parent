import Foundation

public struct AdTechConfig {
    public let primarySdk: SDK
    public let secondarySdk: SDK
    public let placementType: PlacementType
    public let adUnitId: String
    public let nameSuffix: String?
    
    public var name: String {
        var ret = ""
        
        if secondarySdk == .none {
            ret = "\(primarySdk) Solo \(placementType)"
        } else {
            ret = "\(primarySdk) to \(secondarySdk) \(placementType)"
        }
        
        if let nameSuffix {
            ret += " - \(nameSuffix)"
        }
        
        return ret
    }
    
    init(
        primarySdk: SDK,
        secondarySdk: SDK,
        placementType: PlacementType,
        adUnitId: String,
        nameSuffix: String? = nil
    ) {
        self.primarySdk = primarySdk
        self.secondarySdk = secondarySdk
        self.placementType = placementType
        self.adUnitId = adUnitId
        self.nameSuffix = nameSuffix
    }
}
