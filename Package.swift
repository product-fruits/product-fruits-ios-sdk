// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ProductfruitsKit",
    platforms: [.iOS(.v14)],
    products: [.library(name: "ProductfruitsKit", targets: ["ProductfruitsKit"])],
    targets: [
        .binaryTarget(
            name: "ProductfruitsKit",
            url: "https://github.com/product-fruits/product-fruits-ios-sdk/releases/download/v0.1.2/ProductfruitsKit-0.1.2.zip",
            checksum: "960ee3fac1b9980245592eb148771925176152924a3a1f82aca948f82e97f4b3"
        )
    ]
)
