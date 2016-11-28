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
    
    lazy var emitter: SKEmitterNode = {
        [unowned self] in
        let emitterPath = Bundle.main.path(forResource: "Particles", ofType: "sks")!
        return NSKeyedUnarchiver.unarchiveObject(withFile: emitterPath) as! SKEmitterNode
    }()
    
    var birthRate: CGFloat = 0
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = UIColor.black
        emitter.position = CGPoint(x: size.width / 2 + 80, y: size.height / 2)
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
