
import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

// Name : Vishal K Chanchlani
// Student No : 301090878
// Test Date : 19 Feb 2020
// https://github.com/vishalchanchlani/MAPD724-W2020-TestMidterm.git


let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?


class GameScene: SKScene {
    
    var gameManager: GameManager?
    
    var oceanSprite1: Ocean?
    var oceanSprite2: Ocean?
    var planeSprite: Plane?
    var islandSprite: Island?
    var cloudSprites: [Cloud] = []
    
    //var config: Config?
    
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        //self.sceneState = .GAME
        //self.config?.sceneState = .GAME
        self.name = "GAME"
        
        // add ocean
        self.oceanSprite1 = Ocean()
        self.oceanSprite1?.position = CGPoint(x: 0, y: 0)
        self.addChild(oceanSprite1!)
        
        self.oceanSprite2 = Ocean()
        self.oceanSprite2?.position = CGPoint(x: 896, y: 0)
        self.addChild(oceanSprite2!)
        
        // add plane
        self.planeSprite = Plane()
        self.planeSprite?.position = CGPoint(x: -365, y: 0)
        self.addChild(planeSprite!)
        
        // add island
        self.islandSprite = Island()
        self.addChild(islandSprite!)
        
        // add clouds
        for index in 0...0
        {
            let cloud: Cloud = Cloud()
            cloudSprites.append(cloud)
            self.addChild(cloudSprites[index])
        }
        
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        // preload sounds
        do {
            let sounds:[String] = ["thunder", "yay"]
            for sound in sounds
            {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        } catch {
        }
        
    }
    
    //if Plane is dragged down
    func touchDown(atPoint pos : CGPoint)
    {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: -385, y: pos.y))
    }
    
    //if screen is touched
    func touchMoved(toPoint pos : CGPoint)
    {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: -385, y: pos.y))
    }
    
    
    //if Plane is dragged UP
    func touchUp(atPoint pos : CGPoint)
    {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: -385, y: pos.y))
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
    
    
    //Function which updated all Object at regular Interval
    override func update(_ currentTime: TimeInterval)
    {
        self.oceanSprite1?.Update()
        self.oceanSprite2?.Update()
        
        self.planeSprite?.Update()
        self.islandSprite?.Update()
        
        CollisionManager.squaredRadiusCheck(scene: self, object1: planeSprite!, object2: islandSprite!)
        
        for cloud in cloudSprites
        {
            cloud.Update()
            CollisionManager.squaredRadiusCheck(scene: self, object1: planeSprite!, object2: cloud)
        }
        
        if(ScoreManager.Lives < 1)
        {
            self.gameManager?.PresentEndScene()
        }
    }
}
