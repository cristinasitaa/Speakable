//
//  BubbleNode.swift
//  Example
//
//  Created by Neverland on 15.08.15.
//  Copyright (c) 2015 ProudOfZiggy. All rights reserved.
//
import Foundation

import UIKit
import SpriteKit
import SIFloatingCollection

class BubbleNode: SIFloatingNode {
    var labelNode = SKLabelNode(fontNamed: "Arial")
    var messageNode = SKLabelNode(fontNamed: "Arial")
    
    class func instantiateWithTitle(title: String) -> BubbleNode! {
        let node = BubbleNode(circleOfRadius: 30)
        configureNodeWithTitle(node,title: title)
        return node
    }
    
    class func configureNodeWithTitle(_ node: BubbleNode!, title: String) {
        let boundingBox = node.path?.boundingBox;
        let radius = (boundingBox?.size.width)! / 2.0;
        node.physicsBody = SKPhysicsBody(circleOfRadius: radius + 1.5)
        node.fillColor = SKColor.white
        node.strokeColor = node.fillColor
        
        node.labelNode.text = title
        node.labelNode.position = CGPoint.zero
        node.labelNode.fontColor = SKColor(colorLiteralRed: 0.93, green: 0.10, blue: 0.27, alpha: 1)
        node.labelNode.fontSize = 10
        
        node.labelNode.isUserInteractionEnabled = false
        node.labelNode.verticalAlignmentMode = .center
        node.labelNode.horizontalAlignmentMode = .center
        
        
        node.messageNode = node.labelNode.multilined()
        node.messageNode.position = CGPoint.zero //CGPoint(x: frame.midX, y: frame.midY)
        node.messageNode.zPosition = 1001  // On top of all other nodes
        
        node.labelNode = node.messageNode
        
        node.addChild(node.messageNode)
    }

    
    override func selectingAnimation() -> SKAction? {
        removeAction(forKey: BubbleNode.removingKey)
    
        for children in self.messageNode.children {
            if children.name == "innerLabel" {
                let childNodeLabel = children as! SKLabelNode
                childNodeLabel.fontColor = SKColor.white
            }
        }

        self.fillColor = SKColor(colorLiteralRed: 0.93, green: 0.10, blue: 0.27, alpha: 1)
        self.strokeColor = SKColor(colorLiteralRed: 0.93, green: 0.10, blue: 0.27, alpha: 1)

        return SKAction.scale(to: 2, duration: 0.2)
    }
    
    override func normalizeAnimation() -> SKAction? {
        removeAction(forKey: BubbleNode.removingKey)
        for children in self.messageNode.children {
            if children.name == "innerLabel" {
                let childNodeLabel = children as! SKLabelNode
                childNodeLabel.fontColor = SKColor(colorLiteralRed: 0.93, green: 0.10, blue: 0.27, alpha: 1)
            }
        }

        self.fillColor = SKColor.white
        self.strokeColor = SKColor.white
        
        return SKAction.scale(to: 1, duration: 0.2)
    }
    
    override func removeAnimation() -> SKAction? {
        removeAction(forKey: BubbleNode.removingKey)
        return SKAction.fadeOut(withDuration: 0.2)
    }
    
    override func removingAnimation() -> SKAction {
        let pulseUp = SKAction.scale(to: xScale + 0.13, duration: 0)
        let pulseDown = SKAction.scale(to: xScale, duration: 0.3)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatForever(pulse)
        return repeatPulse
    }
}
