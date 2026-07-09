// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ProductfruitsKit",
    platforms: [.iOS(.v14)],
    products: [.library(name: "ProductfruitsKit", targets: ["ProductfruitsKit"])],
    targets: [
        .binaryTarget(
            name: "ProductfruitsKit",
            url: "https://github.com/product-fruits/product-fruits-ios-sdk/releases/download/v0.1.8/ProductfruitsKit-0.1.8.zip",
            checksum: "512a310071a6f86dcc9ffe6bc72911cbabde35d4dc0852dec35af179b3fe908d"
        )
    ]
)
