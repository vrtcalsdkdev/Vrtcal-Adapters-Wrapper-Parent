import Foundation

public struct AdTechConfig {
    public let primarySdk: SDK
    public let secondarySdk: SDK
    public let placementType: PlacementType
    public let adUnitId: String
    
    public var name: String {
        if secondarySdk == .none {
            return "\(primarySdk) Solo \(placementType)"
        } else {
            return "\(primarySdk) to \(secondarySdk) \(placementType)"
        }
    }
}
