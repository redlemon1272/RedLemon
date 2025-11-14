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
        // Pin Vapor ecosystem to stable versions
        .package(url: "https://github.com/vapor/vapor.git", exact: "4.96.0"),
        .package(url: "https://github.com/sparkle-project/Sparkle.git", exact: "2.8.0"),
        .package(url: "https://github.com/apple/swift-nio-extras.git", exact: "1.22.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", exact: "2.26.0"),
        .package(url: "https://github.com/apple/swift-nio-http2.git", exact: "1.30.0")
    ],
    targets: [
        .executableTarget(
            name: "RedLemon",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Sparkle", package: "Sparkle"),
                .product(name: "NIOExtras", package: "swift-nio-extras"),
                .product(name: "NIOSSL", package: "swift-nio-ssl"),
                .product(name: "NIOHTTP2", package: "swift-nio-http2")
            ],
            path: "Sources",
            cSettings: [
                .headerSearchPath("../Frameworks/include")
            ],
            swiftSettings: [
                .unsafeFlags([
                    "-I", "Frameworks/include",
                    "-import-objc-header", "Sources/Features/Player/MPVBridgingHeader.h",
                    "-DGL_SILENCE_DEPRECATION",  // Silence OpenGL deprecation warnings
                    // CPU compatibility flags for older Intel Macs (Haswell)
                    "-Xfrontend", "-disable-objc-attr-requires-foundation-module"
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
    ]
)
