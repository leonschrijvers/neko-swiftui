//
//  NekoImages.swift
//  neko-swiftui
//
//  Created by Leon Schrijvers on 31/12/2024.
//

import AppKit

struct NekoImages {
    static let size: CGFloat = 32
    
    static func fromState(state: NekoState) -> [NSImage] {
        switch state {
            
        case .stop:
            return NekoImages.stop
        case .moveUp:
            return NekoImages.moveUp
        case .moveUpLeft:
            return NekoImages.moveUpLeft
        case .moveUpRight:
            return NekoImages.moveUpRight
        case .moveDown:
            return NekoImages.moveDown
        case .moveDownLeft:
            return NekoImages.moveDownLeft
        case .moveDownRight:
            return NekoImages.moveDownRight
        case .moveLeft:
            return NekoImages.moveLeft
        case .moveRight:
            return NekoImages.moveRight
        case .jare:
            return NekoImages.jare
        case .kaki:
            return NekoImages.kaki
        case .akubi:
            return NekoImages.akubi
        case .sleep:
            return NekoImages.sleep
        case .awake:
            return NekoImages.awake
        }
    }
    
    static let stop = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "mati2", ofType: "gif")!)!
    ]
    
    static let moveUp = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "up1", ofType: "gif")!)!,
        NSImage(contentsOfFile: Bundle.main.path(forResource: "up2", ofType: "gif")!)!
    ]
    
    static let moveUpLeft = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "upleft1", ofType: "gif")!)!,
        NSImage(contentsOfFile: Bundle.main.path(forResource: "upleft2", ofType: "gif")!)!
    ]
    
    static let moveUpRight = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "upright1", ofType: "gif")!)!,
        NSImage(contentsOfFile: Bundle.main.path(forResource: "upright2", ofType: "gif")!)!
    ]
    
    static let moveDown = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "down1", ofType: "gif")!)!,
        NSImage(contentsOfFile: Bundle.main.path(forResource: "down2", ofType: "gif")!)!
    ]
    
    static let moveDownLeft = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "dwleft1", ofType: "gif")!)!,
        NSImage(contentsOfFile: Bundle.main.path(forResource: "dwleft2", ofType: "gif")!)!
    ]
    
    static let moveDownRight = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "dwright1", ofType: "gif")!)!,
        NSImage(contentsOfFile: Bundle.main.path(forResource: "dwright2", ofType: "gif")!)!
    ]
    
    static let moveLeft = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "left1", ofType: "gif")!)!,
        NSImage(contentsOfFile: Bundle.main.path(forResource: "left2", ofType: "gif")!)!
    ]
    
    static let moveRight = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "right1", ofType: "gif")!)!,
        NSImage(contentsOfFile: Bundle.main.path(forResource: "right2", ofType: "gif")!)!
    ]
    
    static let jare = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "jare2", ofType: "gif")!)!,
        NSImage(contentsOfFile: Bundle.main.path(forResource: "mati2", ofType: "gif")!)!,
    ]
    
    static let kaki = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "kaki2", ofType: "gif")!)!,
        NSImage(contentsOfFile: Bundle.main.path(forResource: "kaki2", ofType: "gif")!)!,
    ]
    
    static let akubi = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "mati3", ofType: "gif")!)!,
    ]
    
    static let sleep = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "sleep1", ofType: "gif")!)!,
        NSImage(contentsOfFile: Bundle.main.path(forResource: "sleep2", ofType: "gif")!)!
    ]
    
    static let awake = [
        NSImage(contentsOfFile: Bundle.main.path(forResource: "awake", ofType: "gif")!)!
    ]
}

