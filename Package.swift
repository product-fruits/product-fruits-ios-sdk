// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ProductfruitsKit",
    platforms: [.iOS(.v14)],
    products: [.library(name: "ProductfruitsKit", targets: ["ProductfruitsKit"])],
    targets: [
        .binaryTarget(
            name: "ProductfruitsKit",
            url: "https://github.com/product-fruits/product-fruits-ios-sdk/releases/download/v0.1.4/ProductfruitsKit-0.1.4.zip",
            checksum: "179d073dbf7a37665f82bec4c88b2b21e732667d433190879f0a2204283e2cec"
        )
    ]
)
