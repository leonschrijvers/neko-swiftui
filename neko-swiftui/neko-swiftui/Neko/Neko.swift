//
//  Neko.swift
//  neko-swiftui
//
//  Created by Leon Schrijvers on 31/12/2024.
//

import AppKit

class Neko: ObservableObject {
    @Published var image: NSImage = NekoImages.stop.first!
    @Published var position: CGPoint = .zero
    
    private var timer: Timer?
    
    private var state = NekoState.stop
    private var stateImages: [NSImage] = NekoImages.stop
    
    private var moveDx: CGFloat = 0
    private var moveDy: CGFloat = 0
    
    private var tickCount = 0
    private var stateCount = 0
        
    private let moveSpeed = 13.0

    var isNekoMoveStart: Bool {
        return abs(self.moveDx) > 6 || abs(self.moveDy) > 6
    }
    
    func setPosition(position: CGPoint) {
        self.position = position
    }

    func resume() {
        self.timer?.invalidate()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.125, repeats: true) { timer in
            self.handleTimer()
        }
    }
    
    func pause() {
        self.timer?.invalidate()
    }
 
    func handleTimer() {
        var x = self.position.x
        var y = self.position.y
        
        self.calcDxDyFor(x: x, y: y)
                
        if self.state == .sleep {
            self.image = self.stateImages[self.tickCount % self.stateImages.count]
        } else {
            self.image = self.stateImages[(self.tickCount >> 2) % self.stateImages.count]
        }
                
        self.advanceClock()
        
        switch self.state {
        case .stop:
            self.handleTransition(stateCount: 4, state: .jare)
            
            if isNekoMoveStart {
                self.setStateTo(state: .awake)
                return
            }
        case .moveUp, .moveUpLeft, .moveUpRight, .moveDown, .moveDownLeft, .moveDownRight, .moveLeft, .moveRight:
            x += self.moveDx
            y += self.moveDy
            self.updateDirection()
        case .jare:
            self.handleTransition(stateCount: 10, state: .kaki)
        case .kaki:
            self.handleTransition(stateCount: 4, state: .akubi)
        case .akubi:
            self.handleTransition(stateCount: 6, state: .sleep)
        case .sleep:
            if isNekoMoveStart {
                self.setStateTo(state: .awake)
            }
        case .awake:
            if self.stateCount >= 3 {
                self.updateDirection()
            }
        }
        
        self.position = CGPoint(x: x, y: y)
    }
    
    func calcDxDyFor(x: CGFloat, y: CGFloat) {
        let mousePoint = NSEvent.mouseLocation
        let mouseX = mousePoint.x
        let mouseY = mousePoint.y
        
        let deltaX = floor(mouseX - x - NekoImages.size * 0.5)
        let deltaY = floor(mouseY - y)
        
        let length = hypot(deltaX, deltaY)
        
        if length == 0 {
            self.moveDx = 0
            self.moveDy = 0
        } else {
            if length < self.moveSpeed {
                self.moveDx = deltaX
                self.moveDy = deltaY
            } else {
                self.moveDx = (self.moveSpeed * deltaX) / length
                self.moveDy = (self.moveSpeed * deltaY) / length
            }
        }
    }
    
    func advanceClock() {
        if self.tickCount < 255 {
            self.tickCount += 1
        } else {
            self.tickCount = 0
        }
        
        if self.tickCount % 2 == 0 {
            if self.stateCount < 255 {
                self.stateCount += 1
            } else {
                self.stateCount = 0
            }
        }
    }
    
    func setStateTo(state: NekoState) {
        if self.state != state {
            self.tickCount = 0
            self.stateCount = 0
                        
            self.state = state
            self.stateImages = NekoImages.fromState(state: state)
        }
    }
    
    func handleTransition(stateCount: Int, state: NekoState) {
        if isNekoMoveStart {
            self.setStateTo(state: .awake)
            return
        }
        
        if self.stateCount >= stateCount {
            self.setStateTo(state: state)
        }
    }
    
    func updateDirection() {
        var newState: NekoState
        
        let sinPiPer8 = sin(Double.pi/8)
        let sinPiPer8Times3 = sin(Double.pi/8*3)
        
        if self.moveDx == 0 && self.moveDy == 0 {
            newState = .stop
        } else {
            let largeX = self.moveDx
            let largeY = self.moveDy
            
            let length = sqrt(largeX * largeX + largeY * largeY)
            let sinTheta = largeY / length
            
            if self.moveDx > 0 {
                if sinTheta > sinPiPer8Times3 {
                    newState = .moveUp
                } else if sinTheta > sinPiPer8 {
                    newState = .moveUpRight
                } else if sinTheta > -sinPiPer8 {
                    newState = .moveRight
                } else if sinTheta > -sinPiPer8Times3 {
                    newState = .moveDownRight
                } else {
                    newState = .moveDown
                }
            } else {
                if sinTheta > sinPiPer8Times3 {
                    newState = .moveUp
                } else if sinTheta > sinPiPer8 {
                    newState = .moveUpLeft
                } else if sinTheta > -sinPiPer8 {
                    newState = .moveLeft
                } else if sinTheta > -sinPiPer8Times3 {
                    newState = .moveDownLeft
                } else {
                    newState = .moveDown
                }
            }
        }
        
        self.setStateTo(state: newState)
    }
}
