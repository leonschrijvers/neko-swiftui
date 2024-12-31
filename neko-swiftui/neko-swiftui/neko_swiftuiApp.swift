//
//  neko_swiftuiApp.swift
//  neko-swiftui
//
//  Created by Leon Schrijvers on 31/12/2024.
//

import SwiftUI

@main
struct neko_swiftuiApp: App {
    @Environment(\.openWindow) var openWindow
    
    @AppStorage("visible") private var visible: Bool = true
    
    @ObservedObject private var launchAtLogin = SettingsManager.launchAtLogin
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        MenuBarExtra("Neko", image: "MenubarIcon") {
            Button {
                NSApp.activate(ignoringOtherApps: true)
                openWindow(id: "AboutWindow")
            } label: {
                Text("About neko-swiftui")
            }
            
            Divider()
            
            Button {
                visible.toggle()
            } label: {
                Text(visible ? "Hide Neko" : "Show Neko")
            }
            
            Divider()
            
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
        
        Window("About", id: "AboutWindow") {
            AboutView()
                .fixedSize()
        }
        .windowResizability(.contentSize)
    }
}
