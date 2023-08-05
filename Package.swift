// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SymbolicBridge",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "SymbolicBridge",
            targets: ["SymbolicBridge"]),
    ],
    targets: [
        .target(
            name: "SymbolicBridge",
            dependencies: [])
    ]
)
