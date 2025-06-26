// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ProductfruitsKit",
    platforms: [.iOS(.v14)],
    products: [.library(name: "ProductfruitsKit", targets: ["ProductfruitsKit"])],
    targets: [
        .binaryTarget(
            name: "ProductfruitsKit",
            url: "https://github.com/product-fruits/product-fruits-ios-sdk/releases/download/v0.1.0/ProductfruitsKit-0.1.0.zip",
            checksum: "3d29cef9a1ad0be271fd0e61f58f2602d0aee53ead40b18dbdd2a0bd4f287521"
        )
    ]
)
