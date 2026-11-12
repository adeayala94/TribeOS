// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "TribeOS",
    platforms: [.macOS(.v15), .iOS(.v18)],
    products: [
        .library(name: "TribeOSCore", targets: ["TribeOSCore"]),
        .executable(name: "tribeos", targets: ["tribeos"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.2.1"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.8.2"),
        .package(url: "https://github.com/apple/swift-asn1.git", from: "1.7.4"),
        .package(url: "https://github.com/apple/swift-async-algorithms.git", from: "1.1.7"),
        .package(url: "https://github.com/apple/swift-atomics.git", from: "1.3.1"),
        .package(url: "https://github.com/apple/swift-certificates.git", from: "1.21.1"),
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.7.6"),
        .package(url: "https://github.com/apple/swift-crypto.git", "3.12.0"..<"5.0.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.105.0"),
        .package(url: "https://github.com/apple/swift-numerics.git", from: "1.1.1"),
        .package(url: "https://github.com/apple/swift-system.git", from: "1.9.0"),
    ],
    targets: [
        .target(
            name: "TribeOSCore",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "SwiftASN1", package: "swift-asn1"),
                .product(name: "AsyncAlgorithms", package: "swift-async-algorithms"),
                .product(name: "Atomics", package: "swift-atomics"),
                .product(name: "X509", package: "swift-certificates"),
                .product(name: "Collections", package: "swift-collections"),
                .product(name: "Crypto", package: "swift-crypto"),
                .product(name: "NIOCore", package: "swift-nio"),
                .product(name: "NIOPosix", package: "swift-nio"),
                .product(name: "Numerics", package: "swift-numerics"),
                .product(name: "SystemPackage", package: "swift-system"),
            ]
        ),
        .executableTarget(
            name: "tribeos",
            dependencies: [
                "TribeOSCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "TribeOSCoreTests",
            dependencies: ["TribeOSCore"]
        ),
    ]
)
