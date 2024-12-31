//
//  ContentView.swift
//  neko-swiftui
//
//  Created by Leon Schrijvers on 31/12/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("visible") private var visible: Bool = true
    
    @StateObject private var neko = Neko()
    
    var body: some View {
        Group {
            if visible {
                Image(nsImage: neko.image)
            }
        }
        .onAppear {
            if let window = NSApp.windows.first {
                window.styleMask = [.borderless]
                window.level = .popUpMenu
                window.isOpaque = false
                window.canHide = false
                window.ignoresMouseEvents = true
                window.isMovableByWindowBackground = false
                window.hidesOnDeactivate = false
                window.setFrame(NSRect(x: 0, y: 0, width: NekoImages.size, height: NekoImages.size), display: false)
                window.center()
                window.backgroundColor = .clear
                window.collectionBehavior = [.canJoinAllSpaces, .stationary, .fullScreenNone]
                window.hasShadow = false
                
                neko.setPosition(position: window.frame.origin)
                neko.resume()
            }
        }
        .onChange(of: neko.position) {
            if let window = NSApp.windows.first {
                window.setFrameOrigin(neko.position)
            }
        }
        .onChange(of: visible) {
            if visible {
                neko.resume()
            } else {
                neko.pause()
            }
        }
    }
}

#Preview {
    ContentView()
}
