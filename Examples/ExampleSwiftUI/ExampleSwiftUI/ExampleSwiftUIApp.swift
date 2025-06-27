//
//  ExampleSwiftUIApp.swift
//  ExampleSwiftUI
//
//  Created by Dalibor Kundrat on 6/27/25.
//

import SwiftUI
import ProductfruitsKit

@main
struct ExampleSwiftUIApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .onAppear {
                    appState.initializeSDK()
                }
        }
    }
}
