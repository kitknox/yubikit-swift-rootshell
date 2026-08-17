// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YubiKit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
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
                // rootshell's MFi approval is pending. Restoring Lightning support requires
                // removing this define and publishing a new package release.
                .define("DISABLE_MFI_LIGHTNING")
            ]
        ),
        .testTarget(
            name: "YubiKitTests",
            dependencies: ["YubiKit"],
            path: "YubiKit/UnitTests"
        ),
    ]
)
