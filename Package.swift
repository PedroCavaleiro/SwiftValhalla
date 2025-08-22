// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftValhalla",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .visionOS(.v1),
        .watchOS(.v9),
    ],
    products: [
        .library(
            name: "SwiftValhalla",
            targets: ["SwiftValhalla"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/PedroCavaleiro/ExtendedSwift", .upToNextMajor(from: "1.3.1")),
        .package(url: "https://github.com/PedroCavaleiro/SwiftlyRest.git", .upToNextMajor(from: "1.7.0")),
    ],
    targets: [
        .target(
            name: "SwiftValhalla",
            dependencies: [
                .product(name: "ExtendedSwift", package: "ExtendedSwift"),
                .product(name: "SwiftlyRest", package: "SwiftlyRest"),
            ]
        ),
        .testTarget(
            name: "SwiftValhallaTests",
            dependencies: ["SwiftValhalla"]
        ),
    ]
)
