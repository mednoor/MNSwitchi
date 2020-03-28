// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MNSwitchi",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_15),
        .watchOS(.v5),
        .tvOS(.v11)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "MNSwitchi",
            targets: ["MNSwitchi"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "MNSwitchi",
            dependencies: []),
        .testTarget(
            name: "MNSwitchiTests",
            dependencies: ["MNSwitchi"]),
    ]
)
