// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ProductfruitsKit",
    platforms: [.iOS(.v14)],
    products: [.library(name: "ProductfruitsKit", targets: ["ProductfruitsKit"])],
    targets: [
        .binaryTarget(
            name: "ProductfruitsKit",
            url: "https://github.com/product-fruits/product-fruits-ios-sdk/releases/download/v0.1.3/ProductfruitsKit-0.1.3.zip",
            checksum: "a97116ce41a4e99f62e5dc6b356f60b8331a078b12522d58d841412a24c235c4"
        )
    ]
)
