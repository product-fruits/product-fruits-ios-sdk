![ProductFruits iOS SDK](logo.png)

# ProductFruits iOS SDK

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://swift.org/package-manager)
[![Platform](https://img.shields.io/badge/platform-iOS%2015%2B-blue.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.7%2B-orange.svg)](https://swift.org)

ProductFruits iOS SDK delivers native modal dialogs, animated bottom sheets, immersive carousels, and fullscreen announcements that guide users through your app. Design and launch user onboarding, feature announcements, and contextual help experiences remotely.

## Features

- **🎨 Multiple Experience Types** - Modal dialogs, fullscreen announcements, and carousel experiences
- **🎯 Targeted Announcements** - Show contextual messages to specific user segments
- **📊 Analytics Integration** - Track user engagement and behavior automatically
- **🌐 Real-time Content** - Update content remotely without app store releases
- **🔒 Privacy Focused** - GDPR compliant with user privacy controls

### Experience Types

- **Modal Dialog** - Overlay announcements that appear on top of your content
- **Sheets** - Bottom sheets with auto-height or full-height options for flexible presentation  
- **Carousel** - Multi-step announcements with navigation between slides

## Quick Start

```swift
import ProductfruitsKit

// 1. Configure ProductFruits
let config = ProductFruits.Config(
    projectCode: "your-project-code",
    applicationID: "your-app-id", 
    language: "en"
)

let productFruits = ProductFruits(config: config)

// 2. Identify users
productFruits.identify(
    username: "john@example.com"
)

// 3. Track events and screens
productFruits.track("button_clicked", properties: [
    "button_name": "get_started"
])

productFruits.screen("home_screen")
```

### Installation

#### Swift Package Manager (Recommended)

Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/product-fruits/product-fruits-ios-sdk.git", from: "1.0.0")
]
```

Or add it through Xcode:
1. File → Add Package Dependencies
2. Enter: `https://github.com/product-fruits/product-fruits-ios-sdk.git`

#### Binary Framework

1. Download the latest release zip from [GitHub Releases](https://github.com/product-fruits/product-fruits-ios-sdk/releases)
2. Extract the zip file to get `ProductfruitsKit.xcframework`
3. Drag and drop the framework into your Xcode project
4. Make sure to select "Embed & Sign" in your target's frameworks section

## Documentation

| Resource | Description |
|----------|-------------|
| [📚 Getting Started](docs/getting-started.md) | Complete integration guide |
| [📖 API Reference](docs/api-reference.md) | Complete API documentation |
| [📱 Examples](docs/examples.md) | Code examples and use cases |


## Example

Check out our [example app](docs/examples.md) to see ProductFruits in action:

## Privacy

ProductFruits respects user privacy and is GDPR compliant. The SDK:
- Only collects data you explicitly send - you can remove all user data anytime from our administration 
- Does not share data with third parties

For more details, see our [Privacy Guide](docs/privacy.md).

## Support

- 📖 [Documentation](docs/)
- 💬 [GitHub Issues](https://github.com/product-fruits/product-fruits-ios-sdk/issues)
- 📧 [Email Support](mailto:support@productfruits.com)
- 🌐 [ProductFruits Website](https://www.productfruits.com)


---

<p align="center">
  <img src="logo.png" alt="ProductFruits Logo" width="200"/>
</p>

Made with ❤️ by the [ProductFruits](https://www.productfruits.com) team 