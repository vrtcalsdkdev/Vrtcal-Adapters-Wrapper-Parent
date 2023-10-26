import Foundation

public struct AdTechConfig {
    public let name: String
    public let primarySdk: SDK
    public let secondarySDK: SDK?
    public let placementType: PlacementType
    public let adUnitId: String
}
