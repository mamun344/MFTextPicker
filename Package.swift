// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MFTextPicker",
    platforms: [
            // Only add support for iOS 12 and up.
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MFTextPicker",
            targets: ["MFTextPicker"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MFTextPicker"),
        .testTarget(
            name: "MFTextPickerTests",
            dependencies: ["MFTextPicker"]),
    ]
)
