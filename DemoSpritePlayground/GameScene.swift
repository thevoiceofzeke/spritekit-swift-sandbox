//
//  GameScene.swift
//  DemoSpritePlayground
//
//  Created by Zeke Witter on 2/17/15.
//  Copyright (c) 2015 Zeke Witter. All rights reserved.
//


import SpriteKit

struct SpriteType {
    static let Circle       :   String = "circle"
    static let Square       :   String = "square"
    static let Background   :   String = "background"
}

class GameScene: SKScene {
    
    var selectedNode: SKSpriteNode?
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
                
        // Set no gravity.
        physicsWorld.gravity = CGVectorMake(0, 0)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // Record initial location of touch.
        let touch = touches.anyObject() as UITouch
        let location = touch.locationInNode(self)
        selectSpriteForTouch(location)
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        // Record location of touch.
        let touch = touches.anyObject() as UITouch
        let touchLocation = touch.locationInNode(self)
        
        // Define movement for the sprite.
        let moveAction = SKAction.moveTo(CGPointMake(touchLocation.x, touchLocation.y), duration: 0.0)
        if let node = selectedNode {
            node.runAction(moveAction)
        }
    }
    
    /*
        This method gets the sprite node at the touched location, if one exists.
    
        Note: In this project, a node will always exist, since the background is a sprite itself.
        This means we'll have to do some special handling to determine the type of sprite selected.
    */
    func selectSpriteForTouch(location: CGPoint) {
        // Get the node at the touched location.
        let touchedNode = self.nodeAtPoint(location) as SKSpriteNode
        println("Selected sprite with name: \(touchedNode.name)")
        
        if touchedNode.name!.hasPrefix(SpriteType.Background) {
            // Don't do anything!
        } else {
            // Store the selected node. 
            if selectedNode != touchedNode {
                selectedNode = touchedNode
            }
        }
        
    }

   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
