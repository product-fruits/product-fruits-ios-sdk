# Getting Started with ProductFruits iOS SDK

This guide will walk you through integrating the ProductFruits iOS SDK into your app.

## Prerequisites

- iOS 15.0+
- Xcode 14.0+
- Swift 5.7+
- ProductFruits account ([my.productfruits.com](https://my.productfruits.com))

## Step 1: Installation

### Swift Package Manager (Recommended)

1. Open your Xcode project
2. Go to **File → Add Package Dependencies**
3. Enter the repository URL: `https://github.com/product-fruits/product-fruits-ios-sdk.git`
4. Click **Add Package**
5. Select your target and click **Add Package**

### Binary Framework

1. Download the latest release zip from [GitHub Releases](https://github.com/product-fruits/product-fruits-ios-sdk/releases)
2. Extract the zip file to get `ProductfruitsKit.xcframework`
3. Drag and drop the framework into your Xcode project
4. Make sure to select "Embed & Sign" in your target's frameworks section

## Step 2: Get Your Credentials

### Find Your Project Code and Application ID

1. Log in to your [ProductFruits dashboard](https://app.productfruits.com)
2. Navigate to **Settings → Mobile Apps**
3. Copy your **Project Code** and **Application ID**

## Step 3: Configure Your App

### Initialize the SDK

Add the following to your `AppDelegate.swift`:

```swift
import UIKit
import ProductfruitsKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let config = ProductFruits.Config(
            projectCode: "your-project-code-here",
            applicationID: "your-application-id-here",
            language: "en"
        )
        
        let productFruits = ProductFruits(config: config)
        
        return true
    }
}
```

### SwiftUI Setup

If you're using SwiftUI, add this to your `App.swift`:

```swift
import SwiftUI
import ProductfruitsKit

@main
struct YourApp: App {
    
    let productFruits: ProductFruits
    
    init() {
        let config = ProductFruits.Config(
            projectCode: "your-project-code-here",
            applicationID: "your-application-id-here",
            language: "en"
        )
        
        self.productFruits = ProductFruits(config: config)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

## Step 4: Identify Users

### Basic User Identification

```swift
// Identify user (both userID and username are required)
productFruits.identify(userID: "user123", username: "user123") { success, error in
    if success {
        print("User identified successfully")
    } else {
        print("Failed to identify user: \(error?.localizedDescription ?? "Unknown error")")
    }
}
```

### Advanced User Identification

```swift
// Identify user with additional properties
productFruits.identify(
    userID: "user123",
    username: "john@example.com",
    firstName: "John",
    lastName: "Doe",
    role: "admin",
    additionalProperties: [
        "plan": "premium",
        "department": "engineering"
    ]
) { success, error in
    if success {
        print("User identified with profile")
    } else {
        print("Error: \(error?.localizedDescription ?? "Unknown error")")
    }
}
```

## Step 5: Track Events

### Basic Event Tracking

```swift
// Track a simple event
productFruits.track(name: "button_clicked")

// Track event with properties
productFruits.track(name: "purchase_completed", properties: [
    "item_id": "123",
    "amount": 29.99,
    "currency": "USD"
])
```

### Screen Tracking

Set the current screen to enable screen-based targeting and analytics:

```swift
// Set current screen (automatically tracks screen view)
productFruits.setScreen("home")

// In your view controllers
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    productFruits.setScreen("profile")
}

//Clear current screen
    productFruits.setScreen(nil)

## Step 6: Show Experiences

### Manual Experience Triggering

```swift
// Show a specific experience
productFruits.show(experienceID: "ABC-XYZ-GUID") { success, error in
    if success {
        print("Experience shown")
    } else {
        print("Failed to show experience: \(error?.localizedDescription ?? "Unknown error")")
    }
}
```

## Step 7: Test Your Integration

### Enable Debug Mode

Enable debug logging during development:

```swift
let config = ProductFruits.Config(
    projectCode: "your-project-code-here",
    applicationID: "your-application-id-here",
    language: "en"
)
.logging(true)  // Enable debug logging

let productFruits = ProductFruits(config: config)
```

## Next Steps

- Configure experiences in your ProductFruits dashboard
- Set up push notifications for better engagement

## Troubleshooting

### Common Issues

**SDK not initializing:**
- Verify your project code and application ID are correct
- Check your internet connection

**Events not tracking:**
- Make sure you've identified the user first
- Check your internet connection

**Experiences not showing:**
- Check that experiences are published in your dashboard
- Verify targeting rules match your test user
- Make sure the user has been identified

For more help, contact [ProductFruits support](mailto:support@productfruits.com). 