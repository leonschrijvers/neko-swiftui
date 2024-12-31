//
//  neko_swiftuiApp.swift
//  neko-swiftui
//
//  Created by Leon Schrijvers on 31/12/2024.
//

import SwiftUI

@main
struct neko_swiftuiApp: App {
    @ObservedObject private var launchAtLogin = SettingsManager.launchAtLogin
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        MenuBarExtra("Neko", image: "MenubarIcon") {
            Menu("Settings") {
                Toggle("Launch at login", isOn: $launchAtLogin.enabled)
            }
            
            Divider()
            
            Button {
                exit(0)
            } label: {
                Text("Quit")
            }
        }
    }
}
