// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "RedLemon",
    platforms: [
        .macOS(.v12)  // Target macOS 12 to match actual system
    ],
    products: [
        .executable(name: "RedLemon", targets: ["RedLemon"])
    ],
    dependencies: [
        // Use versions compatible with Swift 5.7 while maintaining functionality
        .package(url: "https://github.com/vapor/vapor.git", exact: "4.96.0"),
        .package(url: "https://github.com/sparkle-project/Sparkle.git", exact: "2.8.0"),
        .package(url: "https://github.com/apple/swift-nio-extras.git", exact: "1.22.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", exact: "2.26.0"),
        .package(url: "https://github.com/apple/swift-nio-http2.git", exact: "1.30.0")
    ],
    targets: [
        .systemLibrary(
            name: "LibMPV",
            path: "Frameworks"
        ),
        .executableTarget(
            name: "RedLemon",
            dependencies: [
                "LibMPV",
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Sparkle", package: "Sparkle"),
                .product(name: "NIOExtras", package: "swift-nio-extras"),
                .product(name: "NIOSSL", package: "swift-nio-ssl"),
                .product(name: "NIOHTTP2", package: "swift-nio-http2")
            ],
            path: "Sources",
            exclude: ["Networking/guestconsolelog.md"],
            resources: [
                .process("../Resources")
            ],
            // Removed cSettings header search path as LibMPV handles it
            swiftSettings: [
                .unsafeFlags([
                    "-DGL_SILENCE_DEPRECATION",
                    "-Xfrontend", "-disable-objc-attr-requires-foundation-module", 
                    "-DMACOS_MODERN_COMPATIBILITY"
                ])
            ],
            linkerSettings: [
                .unsafeFlags([
                    "-Xlinker", "-rpath", "-Xlinker", "@executable_path/../Frameworks",
                    "-Xlinker", "-rpath", "-Xlinker", "@loader_path/../Frameworks",
                    "-L", "Frameworks",
                    "-lmpv.2"
                ])
            ]
        ),
        .testTarget(
            name: "RedLemonTests",
            dependencies: ["RedLemon", "LibMPV"],
            linkerSettings: [
                .unsafeFlags([
                    "-L", "Frameworks",
                    "-lmpv.2",
                    "-Xlinker", "-rpath", "-Xlinker", "@executable_path/../Frameworks"
                ])
            ]
        )
    ]
)
