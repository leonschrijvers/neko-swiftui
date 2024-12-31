//
//  SettingsManager.swift
//  neko-swiftui
//
//  Created by Leon Schrijvers on 31/12/2024.
//

import OSLog
import ServiceManagement

struct SettingsManager {
    static let launchAtLogin = LaunchAtLogin()
}

extension SettingsManager {
    class LaunchAtLogin: ObservableObject {
        let logger = Logger(subsystem: "neko-swiftui", category: "settings")
        
        var enabled: Bool {
            get {
                return SMAppService.mainApp.status == .enabled
            }
            
            set {
                self.objectWillChange.send()
                
                do {
                    if newValue {
                        if SMAppService.mainApp.status == .enabled {
                            try? SMAppService.mainApp.unregister()
                        }
    
                        try SMAppService.mainApp.register()
                    } else {
                        try SMAppService.mainApp.unregister()
                    }
                } catch {
                    logger.error("Failed to \(newValue ? "enable" : "disable") launch at login: \(error.localizedDescription, privacy: .public)")
                }
            }
        }
    }
}
