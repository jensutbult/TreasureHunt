//
//  WinScene.swift
//  Skattjakt
//
//  Created by Jens Utbult on 2016-03-19.
//  Copyright © 2016 Jens Utbult. All rights reserved.
//

import Foundation
import SpriteKit

class WinScene: SKScene {
    
    var emitter: SKEmitterNode!
    var birthRate: CGFloat!
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = UIColor.blackColor()
        let emitterPath = NSBundle.mainBundle().pathForResource("Particles", ofType: "sks")!
        emitter = NSKeyedUnarchiver.unarchiveObjectWithFile(emitterPath) as! SKEmitterNode
        emitter.position = CGPointMake(size.width / 2 + 80, size.height / 2)
        birthRate = emitter.particleBirthRate
        emitter.particleBirthRate = 0
        self.addChild(emitter)
    }
    
    func start() {
        emitter.particleBirthRate = birthRate
    }
    
    func stop() {
        emitter.particleBirthRate = 0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
