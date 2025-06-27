import SwiftUI
import ProductfruitsKit

struct MenuView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                // Header
                VStack(spacing: 10) {
                    Image(systemName: "fork.knife.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.orange)
                    
                    Text("FoodieApp")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("ProductFruits SDK Test App")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                // User status
                if appState.isSDKInitialized, let user = appState.currentUser {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.orange)
                        Text("Welcome, \(user.firstName)!")
                            .fontWeight(.medium)
                        Spacer()
                    }
                    .padding()
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(12)
                }
                
                // Featured items
                VStack(spacing: 15) {
                    Text("Featured Today")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    MenuItemCard(
                        name: "Special Pizza Deal",
                        description: "Get 20% off on all pizzas",
                        icon: "🍕",
                        isEnabled: appState.isSDKInitialized
                    ) {
                        appState.showExperienceByID("c262d120-4d19-4cdf-b847-8e7ce5a7a6c0")
                        appState.trackEvent("special_offer_viewed", properties: [
                            "offer_type": "pizza_discount",
                            "discount_percent": 20
                        ])
                    }
                    
                    MenuItemCard(
                        name: "Track Order",
                        description: "See where your food is",
                        icon: "📍",
                        isEnabled: appState.isSDKInitialized
                    ) {
                        appState.trackEvent("order_tracking_clicked", properties: [
                            "source": "menu_tab"
                        ])
                    }
                }
                
                Spacer()
            }
            .padding()
            .onAppear {
                appState.setScreen("Menu")
            }
        }
    }
}

struct MenuItemCard: View {
    let name: String
    let description: String
    let icon: String
    let isEnabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(icon)
                    .font(.title)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.orange)
            }
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    MenuView()
        .environmentObject(AppState())
} 