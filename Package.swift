// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ProductfruitsKit",
    platforms: [.iOS(.v14)],
    products: [.library(name: "ProductfruitsKit", targets: ["ProductfruitsKit"])],
    targets: [
        .binaryTarget(
            name: "ProductfruitsKit",
            url: "https://github.com/product-fruits/product-fruits-ios-sdk/releases/download/v0.1.1/ProductfruitsKit-0.1.1.zip",
            checksum: "91552d298abf600f3aeab52f92ab7aaf38c8b137ece33dc8d179a6faea02b3cf"
        )
    ]
)
