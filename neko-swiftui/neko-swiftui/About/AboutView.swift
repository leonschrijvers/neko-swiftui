//
//  AboutView.swift
//  neko-swiftui
//
//  Created by Leon Schrijvers on 31/12/2024.
//

import SwiftUI

struct AboutView: View {
    let currentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    
    let url = URL(string: "https://bsky.app/profile/schrijvers.org")

    var body: some View {
        HStack {
            if let image = NSImage(named: NSImage.applicationIconName) {
                Image(nsImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 128, height: 128)
            }
            
            VStack(alignment: .leading) {
                Text("neko-swiftui")
                    .font(.largeTitle)
                
                if !currentVersion.isEmpty {
                    Text("v\(currentVersion)")
                        .foregroundStyle(.secondary)
                }
                
                Text("Do you have any feedback, ideas or questions?\nReach out and share your thoughts!")
                    .padding(.top)
                
                if let url = url {
                    Link("🦋 @schrijvers.org", destination: url)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AboutView()
}
