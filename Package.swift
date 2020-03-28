// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MNSwitchi",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "MNSwitchi",
            targets: ["MNSwitchi"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MNSwitchi",
            dependencies: []),
        .testTarget(
            name: "MNSwitchiTests",
            dependencies: ["MNSwitchi"]),
    ]
)
