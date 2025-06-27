import SwiftUI
import ProductfruitsKit

class AppState: ObservableObject {
    @Published var isSDKInitialized = false
    @Published var currentUser: DummyUser?
    @Published var lastEventTracked = "None"
    @Published var lastExperienceShown = "None"
    
    private var sdk: ProductFruits?
    
    struct DummyUser {
        let username: String
        let firstName: String
        let lastName: String
        let role: String
        let signUpAt: String
    }
    
    func initializeSDK() {
        // Initialize ProductFruits SDK with configuration
        let config = ProductFruits.Config(
            projectCode: "bRPsQsgbiKb1d3ch",
            applicationID: "6be79e66-5fda-4498-9e68-ac6781d96d06",
            language: "en"
        )
        sdk = ProductFruits(config: config)
        
        // Automatically identify with dummy user
        let dummyUser = DummyUser(
            username: "john.smith@productfruits.com",
            firstName: "John",
            lastName: "Smith",
            role: "developer",
            signUpAt: "2024-01-01T00:00:00Z"
        )
        
        sdk?.identify(
            username: dummyUser.username,
            firstName: dummyUser.firstName,
            lastName: dummyUser.lastName,
            signUpAt: dummyUser.signUpAt,
            role: dummyUser.role
        ) { [weak self] success, error in
            DispatchQueue.main.async {
                if success {
                    self?.currentUser = dummyUser
                    self?.isSDKInitialized = true
                    print("✅ SDK initialized and user identified automatically")
                } else {
                    print("❌ Failed to initialize SDK: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }
    }
    
    func trackEvent(_ eventName: String, properties: [String: Any]? = nil) {
        sdk?.track(name: eventName, properties: properties) { [weak self] success, error in
            DispatchQueue.main.async {
                if success {
                    self?.lastEventTracked = eventName
                } else {
                    print("❌ Failed to track event: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }
    }
    
    func showExperienceByID(_ experienceID: String) {
        sdk?.show(experienceID: experienceID) { [weak self] success, error in
            DispatchQueue.main.async {
                if success {
                    self?.lastExperienceShown = experienceID
                } else {
                    print("❌ Failed to show experience: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }
    }
    
    func setScreen(_ screenName: String) {
        sdk?.setScreen(screenName)
    }
    
    func resetSDK() {
        sdk?.reset()
        currentUser = nil
        isSDKInitialized = false
        lastEventTracked = "None"
        lastExperienceShown = "None"
    }
    
    func getCurrentSDKState() -> ProductFruitsState? {
        return sdk?.getCurrentState()
    }
} 
