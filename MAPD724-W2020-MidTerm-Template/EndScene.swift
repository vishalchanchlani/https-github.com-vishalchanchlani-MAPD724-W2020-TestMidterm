
import UIKit
import AVFoundation
import SpriteKit
import GameplayKit


// Name : Vishal K Chanchlani
// Student No : 301090878
// Test Date : 19 Feb 2020
// https://github.com/vishalchanchlani/MAPD724-W2020-TestMidterm.git

class EndScene: SKScene {
    
    
    var oceanSprite1: Ocean?
    var oceanSprite2: Ocean?
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height

        self.name = "END"
        
        // add ocean
        self.oceanSprite1 = Ocean()
        self.oceanSprite1?.position = CGPoint(x: 0, y: 0)
        self.addChild(oceanSprite1!)
        
        self.oceanSprite2 = Ocean()
        self.oceanSprite2?.position = CGPoint(x: 896, y: 0)
        self.addChild(oceanSprite2!)
        
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self))}
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self))}
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self))}
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self))}
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        self.oceanSprite1?.Update()
        self.oceanSprite2?.Update()
    
    }
}

