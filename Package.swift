// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ProductfruitsKit",
    platforms: [.iOS(.v14)],
    products: [.library(name: "ProductfruitsKit", targets: ["ProductfruitsKit"])],
    targets: [
        .binaryTarget(
            name: "ProductfruitsKit",
            url: "https://github.com/product-fruits/product-fruits-ios-sdk/releases/download/v0.1.7/ProductfruitsKit-0.1.7.zip",
            checksum: "951cda6e5d8a3471d7a9cb14833d80b226f12ea9d0ad5be11ea8852ff213bcaf"
        )
    ]
)
