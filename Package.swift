// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LottieHelperKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "LottieHelperKit",
            targets: ["LottieHelperKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.3.0")
    ],
    targets: [
        .target(
            name: "LottieHelperKit",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios")
            ]
        ),
        .testTarget(
            name: "LottieHelperKitTests",
            dependencies: ["LottieHelperKit"]),
    ]
)
