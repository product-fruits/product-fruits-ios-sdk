# API Reference

This document provides a complete reference for the ProductFruits iOS SDK API.

## Table of Contents

- [Configuration](#configuration)
- [SDK Initialization](#sdk-initialization)
- [Experience Types](#experience-types)
- [User Management](#user-management)
- [Event Tracking](#event-tracking)
- [Experience Management](#experience-management)
- [Push Notifications](#push-notifications)
- [State Management](#state-management)
- [URL Handling](#url-handling)

## Configuration

### ProductFruits.Config

The main configuration class for the ProductFruits SDK.

#### Initialization

```swift
let config = ProductFruits.Config(
    projectCode: "your-project-code",
    applicationID: "your-app-id",
    language: "en"
)
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `projectCode` | `String` | ✅ | Your ProductFruits project code |
| `applicationID` | `String` | ✅ | Your mobile application ID |
| `language` | `String` | ✅ | Language code (ISO 639-1) |

#### Configuration Methods

```swift
// Enable debug logging
config.logging(true)

// Trust localhost certificates (development only)
config.trustLocalhostCertificates()

// Set device properties
config.deviceProperties([
    "device_type": "tablet",
])

// Set user language
config.setUserLanguage("fr")

// Configure activity storage
config.activityStorageMaxSize(50)
config.activityStorageMaxAge(3600) 
```

## SDK Initialization

### ProductFruits

The main SDK class.

#### Initialization

```swift
let productFruits = ProductFruits(config: config)
```

## User Management

### User Identification

#### identify(username:firstName:lastName:signUpAt:role:additionalProperties:completion:)

Identifies a user with the ProductFruits system.

```swift
// Basic identification (required parameters only)
productFruits.identify(
    username: "john@example.com"
)

// Full identification with optional parameters
productFruits.identify(
    username: "john@example.com",
    firstName: "John",
    lastName: "Doe",
    signUpAt: "2023-01-15T10:30:00Z",
    role: "admin",
    additionalProperties: [
        "plan": "premium",
        "department": "engineering"
    ]
) { success, error in
    if success {
        print("User identified successfully")
    } else {
        print("Error: \(error?.localizedDescription ?? "Unknown error")")
    }
}
```

##### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `username` | `String` | ✅ | Username or email |
| `firstName` | `String?` | ❌ | User's first name |
| `lastName` | `String?` | ❌ | User's last name |
| `signUpAt` | `String?` | ❌ | ISO 8601 sign-up date |
| `role` | `String?` | ❌ | User's role |
| `additionalProperties` | `[String: Any]?` | ❌ | Custom user properties |
| `completion` | `((Bool, Error?) -> Void)?` | ❌ | Completion handler |


#### reset()

Resets the current user session and state

```swift
productFruits.reset()
```

## Event Tracking

### track(_:properties:completion:)

Tracks a custom event.

```swift
productFruits.track("button_clicked", properties: [
    "button_name": "subscribe",
    "screen": "pricing",
    "plan_selected": "premium"
]) { success, error in
    if success {
        print("Event tracked successfully")
    }
}
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `eventName` | `String` | ✅ | Name of the event |
| `properties` | `[String: Any]` | ❌ | Event properties |
| `completion` | `((Bool, Error?) -> Void)?` | ❌ | Completion handler |

### screen(_:properties:completion:)

Tracks a screen view.

```swift
productFruits.screen("dashboard", properties: [
    "user_type": "premium",
    "widgets_count": 5
]) { success, error in
    if success {
        print("Screen view tracked")
    }
}
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `screenName` | `String` | ✅ | Name of the screen |
| `properties` | `[String: Any]` | ❌ | Screen properties |
| `completion` | `((Bool, Error?) -> Void)?` | ❌ | Completion handler |

## Experience Management

### show(experienceID:completion:)

Shows a specific experience by ID.

```swift
productFruits.show(experienceID: "exp_123") { success, error in
    if success {
        print("Experience shown successfully")
    }
}
```

### showRaw(jsonString:completion:)

Shows an experience from raw JSON data.

```swift
let jsonData = """
{
    "type": "announcement",
    "title": "Welcome!",
    "content": "Welcome to our app!"
}
"""

productFruits.showRaw(jsonString: jsonData) { success, error in
    if success {
        print("Raw experience shown")
    }
}
```

## Push Notifications

### setPushToken(_:)

Sets the device's push notification token.

```swift
func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    productFruits.setPushToken(deviceToken)
}
```

### getPushToken()

Gets the current push notification token.

```swift
if let token = productFruits.getPushToken() {
    print("Push token: \(token)")
}
```

### didReceiveNotification(response:completionHandler:)

Handles received push notifications.

```swift
func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    let handled = productFruits.didReceiveNotification(
        response: response,
        completionHandler: completionHandler
    )
    
    if !handled {
        // Handle non-ProductFruits notifications
        completionHandler()
    }
}
```

## State Management

### getCurrentState()

Gets the current SDK state.

```swift
let state = productFruits.getCurrentState()

print("Username: \(state.userID)")
print("Project Code: \(state.projectCode)")
print("Is Active: \(state.isActive)")
print("Status: \(state.statusDescription)")
```

#### ProductFruitsState Properties

| Property | Type | Description |
|----------|------|-------------|
| `version` | `String` | SDK version |
| `projectCode` | `String` | Current project code |
| `userID` | `String` | Current username |
| `deviceID` | `String` | Device identifier |
| `sessionID` | `String?` | Current session ID |
| `isActive` | `Bool` | Whether SDK is active |
| `lastUpdated` | `String` | Last update timestamp |
| `status` | `IdentificationStatus` | Current identification status |
| `statusDescription` | `String` | Human-readable status |

#### IdentificationStatus Enum

```swift
public enum IdentificationStatus: Int {
    case notIdentified = 0
    case anonymous = 1
    case identified = 2
}
```

## URL Handling

### didHandleURL(_:)

Handles deep links and URL schemes.

```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    if productFruits.didHandleURL(url) {
        return true
    }
    
    // Handle other URLs
    return false
}
```

### filterAndHandle(_:)

Filters and handles multiple URL contexts (iOS 13+).

```swift
func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    if let remaining = productFruits.filterAndHandle(URLContexts) {
        // Handle remaining URLs that weren't processed by ProductFruits
        for context in remaining {
            // Handle other URLs
        }
    }
}
```

## Error Handling

### ProductFruitsError

Common errors returned by the SDK.

```swift
public enum ProductFruitsError: Error {
    case invalidUsername
    case networkError
    case configurationError
    case invalidData
}
```

## Notifications

### State Change Notifications

Listen for SDK state changes:

```swift
NotificationCenter.default.addObserver(
    self,
    selector: #selector(productFruitsStateChanged),
    name: .productFruitsStateChanged,
    object: nil
)

@objc private func productFruitsStateChanged(_ notification: Notification) {
    if let state = notification.userInfo?["state"] as? ProductFruitsState {
        print("SDK state changed: \(state.statusDescription)")
    }
}
```

### Thread Safety

The SDK is thread-safe, but UI updates should be on the main thread:

```swift
DispatchQueue.global(qos: .background).async {
    // Background work
    productFruits.track("background_task_completed")
    
    DispatchQueue.main.async {
        // Update UI
        self.updateUIAfterTracking()
    }
}
```

### Performance

- Use completion callbacks for non-critical events

### Memory Management

The SDK manages its own memory. Store the ProductFruits instance as a property to ensure it stays in memory:

```swift
class AppService {
    private let productFruits: ProductFruits
    
    init() {
        let config = ProductFruits.Config(/* ... */)
        self.productFruits = ProductFruits(config: config)
    }
}
``` 