import SwiftUI
import ProductfruitsKit

struct SettingsView: View {
    @EnvironmentObject var appState: AppState
    @State private var sdkState: ProductFruitsState?
    
    var body: some View {
        NavigationView {
            List {
                Section("User Information") {
                    if let state = sdkState {
                        HStack {
                            Image(systemName: state.isAnonymous ? "person.fill.questionmark" : "person.fill")
                                .foregroundColor(state.isAnonymous ? .orange : .blue)
                            VStack(alignment: .leading) {
                                Text(state.isAnonymous ? "Anonymous User" : (appState.currentUser?.firstName ?? "User"))
                                    .fontWeight(.medium)
                                Text("Status: \(state.statusDescription)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "number")
                                .foregroundColor(.orange)
                            Text("User ID")
                            Spacer()
                            Text(state.userID)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        }
                        
                        HStack {
                            Image(systemName: "iphone")
                                .foregroundColor(.purple)
                            Text("Device ID")
                            Spacer()
                            Text(state.deviceID)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        }
                        
                        if let sessionID = state.sessionID {
                            HStack {
                                Image(systemName: "timer")
                                    .foregroundColor(.green)
                                Text("Session ID")
                                Spacer()
                                Text(sessionID)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                                    .truncationMode(.middle)
                            }
                        }
                    } else {
                        HStack {
                            Image(systemName: "person.fill.questionmark")
                                .foregroundColor(.gray)
                            Text("No SDK State Available")
                        }
                    }
                }
                
                Section("SDK Configuration") {
                    HStack {
                        Image(systemName: "power")
                            .foregroundColor((sdkState?.isActive ?? false) ? .green : .red)
                        Text("SDK Status")
                        Spacer()
                        Text((sdkState?.isActive ?? false) ? "Active" : "Inactive")
                            .foregroundColor((sdkState?.isActive ?? false) ? .green : .red)
                    }
                }
                
                Section("SDK Info") {
                    if let state = sdkState {
                        HStack {
                            Image(systemName: "key.fill")
                                .foregroundColor(.orange)
                            Text("Project Code")
                            Spacer()
                            Text(state.projectCode)
                                .foregroundColor(.secondary)
                        }
                        
                        HStack {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.blue)
                            Text("SDK Version")
                            Spacer()
                            Text(state.version)
                                .foregroundColor(.secondary)
                        }
                        
                    } else {
                        HStack {
                            Image(systemName: "exclamationmark.triangle")
                                .foregroundColor(.orange)
                            Text("SDK State Not Available")
                        }
                    }
                }
            }
            .onAppear {
                appState.setScreen("Settings")
                loadSDKState()
            }
        }
    }
    
    private func loadSDKState() {
        sdkState = appState.getCurrentSDKState()
    }
}

#Preview {
    SettingsView()
        .environmentObject(AppState())
} 
