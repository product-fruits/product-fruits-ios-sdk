// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ProductfruitsKit",
    platforms: [.iOS(.v14)],
    products: [.library(name: "ProductfruitsKit", targets: ["ProductfruitsKit"])],
    targets: [
        .binaryTarget(
            name: "ProductfruitsKit",
            url: "https://github.com/product-fruits/product-fruits-ios-sdk/releases/download/v0.1.5/ProductfruitsKit-0.1.5.zip",
            checksum: "72d4484ca020c6be006caef789d120f9388dd59207a7d95686970781862db4b5"
        )
    ]
)
