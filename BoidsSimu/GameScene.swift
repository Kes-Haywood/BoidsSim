//
//  GameScene.swift
//  BoidsSimu
//
//  Created by Fiona Colbert on 6/12/20.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var boids = [SKSpriteNode]()
    var actRotation = [CGFloat]()
    var numboids = 1
   
    
    override func didMove(to view: SKView) {
        // 2
        backgroundColor = SKColor.white
        
        /*
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(moveBoid),
                SKAction.wait(forDuration: 0.03)
            ])
        ))
 */
        
        
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func moveBoid() {
        var turn = true
        
        for i in 0...numboids{
            //boids[i].physicsBody?.velocity = CGVector(dx: 0, dy: 50);
            
            boids[i].physicsBody?.applyForce(CGVector(dx: 0, dy: 1));
            
            /*
            //screen bounds
            if ((boids[i].position.y + 10) < size.height){
                if ((boids[i].position.y + 10) < size.width){
                    if ((boids[i].position.y + 10) > 0){
                        if ((boids[i].position.y + 10) > 0){
                            turn = false
                        }
                    }
                }
            }
            */
            boids[i].physicsBody?.applyTorque(0.0001)
            //boids[i].zRotation = CGFloat((Double(0.2) * Double(180) / Double.pi))
            
            let rotate = (Double(boids[i].zRotation) * Double(180) / Double.pi)
            print("zrotate: ", rotate);
            
            //actRotation[i] = remainder(actRotation[i] + boids[i].zRotation, 360)
            
            if turn {
                //if (actRotation[i] >= 0 && actRotation[i] < 90)
            }
            
            //coherence
            
            //separation
            
            //alignment
            
            //visual range
            
            
            //boids[i].physicsBody?.applyForce(CGVector(dx: 0, dy: 10));
        }
    }
    
    func addBoid() {
        
        for i in 0...numboids{
            // Create sprite
            let boid = SKSpriteNode(imageNamed: "boid")
            
            // Determine where to spawn the boid along the Y axis
            let actualY = (remainder(CGFloat(i * 25), 125) + size.height/4)
            
            // Position the boid slightly off-screen along the right edge,
            // and along a random position along the Y axis as calculated above
            boid.position = CGPoint(x: (size.width/2 + boid.size.width/2) - (CGFloat(i) * 15), y: actualY)
            
            boid.physicsBody = SKPhysicsBody(texture: boid.texture!, size: boid.texture!.size())
            
            boid.physicsBody?.isDynamic = true
            
            boid.physicsBody?.affectedByGravity = false
            
            
            // Add the boid to the scene
            addChild(boid)
            
            //print("index", boids.count)
            
            boids.append(boid)
            actRotation.append(0.0)
            
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        moveBoid()
    }
}
