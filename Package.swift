// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YubiKit",
    platforms: [
        .macOS(.v13), .iOS(.v16),
    ],
    products: [
        .library(
            name: "YubiKit",
            targets: ["YubiKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "YubiKit",
            path: "YubiKit/YubiKit",
            swiftSettings: [
                // TEMPORARY: Disable Lightning/ExternalAccessory to pass App Store review.
                // Yubico MFI approval pending. Remove this line to restore Lightning support.
                // See also: ghostty-ios Info.plist, AppStore.xcconfig, Standalone.xcconfig
                .define("DISABLE_MFI_LIGHTNING"),
            ]
        ),
        .testTarget(
            name: "YubiKitTests",
            dependencies: ["YubiKit"],
            path: "YubiKit/UnitTests"
        ),
    ]
)
