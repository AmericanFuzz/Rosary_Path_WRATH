//
//  Functions_&&_Variables.swift
//  Rosary_Path
//
//  Created by Sebastian Kazakov on 8/1/23.
//

import Foundation
import SpriteKit
import SwiftUI

func orientNode(node: SKSpriteNode, toPoint: CGPoint){
    let wx = node.position.x
    let wy = node.position.y
    let px = toPoint.x
    let py = toPoint.y
    
    let dx = px - wx
    let dy = py - wy
    
    let correctionAngle = Float.pi / 2
    
    let angle = Angle(degrees: (atan2(-dy, dx)))
    
    let usableAngle = Float(angle.degrees) + correctionAngle

    node.zRotation = CGFloat(usableAngle * -1.0)
}

func orientNodeSmoothly(node: SKSpriteNode, toPoint: CGPoint){
    let wx = node.position.x
    let wy = node.position.y
    let px = toPoint.x
    let py = toPoint.y
    
    let dx = px - wx
    let dy = py - wy
    
    let correctionAngle = Float.pi / 2
    
    let angle = Angle(degrees: (atan2(-dy, dx)))
    
    let usableAngle = Float(angle.degrees + Double(correctionAngle)) * -1.0

    let nodeFinalPos = CGFloat(usableAngle)
    
    let nodeCurrentPos = node.zRotation
    
    var zDif = nodeFinalPos - nodeCurrentPos
    
    if zDif < 0{
        zDif *= -1.0
    }
    
    node.run(SKAction.sequence([SKAction.rotate(toAngle: nodeFinalPos, duration: 0.75)]))
}

func orientNodeSmoothlyTime(node: SKSpriteNode, fromPoint: CGPoint, toPoint: CGPoint) -> CGFloat{
    let wx = node.position.x
    let wy = node.position.y
    let px = toPoint.x
    let py = toPoint.y
    let fpx = fromPoint.x
    let fpy = fromPoint.y
    
    
    let dx = px - fpx
    let dy = py - fpy
    
    let correctionAngle = Float.pi / 2
    
    let angle = Angle(degrees: (atan2(-dy, dx)))
    
    let usableAngle = Float(angle.degrees + Double(correctionAngle)) * -1.0

    var nodeFinalPos = CGFloat(usableAngle)
    
    var nodeCurrentPos = node.zRotation
    
    if nodeFinalPos < 0{
        nodeFinalPos *= -1.0
    }
    
    if nodeCurrentPos < 0{
        nodeCurrentPos *= -1.0
    }
    
    print(nodeCurrentPos)
    print(node)
    
    let zDif = CGFloat(nodeFinalPos - nodeCurrentPos)
    
    return 2.0
}

func findDegrees(fromPoint: CGPoint, toPoint: CGPoint) -> Int{
    let wx = fromPoint.x
    let wy = fromPoint.y
    let px = toPoint.x
    let py = toPoint.y
    
    let dx = px - wx
    let dy = py - wy
    
    let correctionAngle = Float.pi / 2
    
    let angle = Angle(degrees: (atan2(-dy, dx)))
    
    let usableAngle = Float(angle.degrees) + correctionAngle

    let returnedAngle = Int(((usableAngle * -1.0) / .pi) * 180) + 90
    
    return returnedAngle
}

func calculateTimeToTravel(node: SKSpriteNode, toPoint: SKSpriteNode) -> CFTimeInterval{
    let wx = node.position.x
    let wy = node.position.y
    let px = toPoint.position.x
    let py = toPoint.position.y
    
    let distance: CGFloat = sqrt((px - wx)*(px - wx) + (py - wy)*(py - wy))

    let time = distance / 500
    
    return CFTimeInterval(time)
}


func randomInRange(lo: Int, hi : Int) -> Int {
    return lo + Int(arc4random_uniform(UInt32(hi - lo + 1)))
}


final class HapticsManager{
    
    static let shared = HapticsManager()
    
    public func selectVibration(){
        DispatchQueue.main.async {
            let feedback = UISelectionFeedbackGenerator()
            feedback.prepare()
            feedback.selectionChanged()
        }
    }
    
    public func beginVibration(type: UINotificationFeedbackGenerator.FeedbackType){
        DispatchQueue.main.async {
            let notification = UINotificationFeedbackGenerator()
            notification.prepare()
            notification.notificationOccurred(type)
        }
    }
}

func addWRATH(sceneTo: SKScene, position: CGPoint) -> SKSpriteNode{
    let element = SKSpriteNode(imageNamed: "WrathNode")
    element.position = position
    element.setScale(0.5)
    element.zPosition = 1
    sceneTo.addChild(element)
    
    return element
}
