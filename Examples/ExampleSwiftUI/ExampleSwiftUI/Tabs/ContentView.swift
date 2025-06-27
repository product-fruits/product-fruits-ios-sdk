//
//  ContentView.swift
//  ExampleSwiftUI
//
//  Created by Dalibor Kundrat on 6/27/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Menu")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
        .accentColor(.orange)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
}


