import SpriteKit
import GameplayKit

// Name : Vishal K Chanchlani
// Student No : 301090878

class Island: GameObject
{
    
    
    //constructor
    init()
    {
        super.init(imageString: "island", initialScale: 1.7)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Life Cycle Functions
    override func CheckBounds()
    {
        // bottom boundary
        if(self.position.x < -715)
        {
            self.Reset()
        }
        
        // right boundary
        if(self.position.y >= 307 - self.halfWidth!)
        {
            self.position.y = 307 - self.halfWidth!
        }
        
        // left boundary
        if(self.position.y <= -307 + self.halfWidth!)
        {
            self.position.y = -307 + self.halfWidth!
        }
    }
    
    func Move()
    {
        self.position.x -= self.dx!
    }
    
    override func Reset()
    {
        self.position.x = 715
        let randomY:Int = (randomSource?.nextInt(upperBound: 614))! - 307
        self.position.y = CGFloat(randomY)
        self.isColliding = false
    }
    
    override func Start()
    {
        self.zPosition = 1
        self.Reset()
        self.dx = 5.0
    }
    
    override func Update()
    {
        self.Move()
        self.CheckBounds()
    }
}
