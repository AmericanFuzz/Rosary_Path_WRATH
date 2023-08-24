//
//  GameScene.swift
//  Rosary_Path
//
//  Created by Sebastian Kazakov on 8/1/23.
//

import SwiftUI
import SpriteKit
import GameplayKit
import CoreLocation


class PathScene: SKScene, CLLocationManagerDelegate {
    
    var point = SKSpriteNode()
    var point2 = SKSpriteNode()
    var point3 = SKSpriteNode()
    var point4 = SKSpriteNode()
    var point5 = SKSpriteNode()
    var point6 = SKSpriteNode()
    var point7 = SKSpriteNode()
    var point8 = SKSpriteNode()
    var point9 = SKSpriteNode()
    var point10 = SKSpriteNode()
    var point11 = SKSpriteNode()
    var point12 = SKSpriteNode()
    var point13 = SKSpriteNode()
    var point14 = SKSpriteNode()
    var point15 = SKSpriteNode()
    var point16 = SKSpriteNode()
    var line = SKShapeNode()
    var line2 = SKShapeNode()
    var line3 = SKShapeNode()
    var line4 = SKShapeNode()
    var line5 = SKShapeNode()
    var line6 = SKShapeNode()
    var line7 = SKShapeNode()
    var line8 = SKShapeNode()
    var line9 = SKShapeNode()
    var line10 = SKShapeNode()
    var line11 = SKShapeNode()
    var line12 = SKShapeNode()
    var line13 = SKShapeNode()
    var line14 = SKShapeNode()
    var line15 = SKShapeNode()
    var line16 = SKShapeNode()
    var BirdCamera = SKCameraNode()
    var OGLocation = CGPoint()
    var Xdif = CGFloat()
    var Ydif = CGFloat()
    var wrath = SKSpriteNode()
    var isEditingPath: Bool = true
    var editButton = SKSpriteNode()
    var clearButton = SKSpriteNode()
    var runButton = SKSpriteNode()
    var buttonBackdrop = SKSpriteNode()
    var isRunTheDominantButton: Bool = true
    var BaseNum = Int()
    var failSafe = false
    var pan = SKSpriteNode()
    var panTexture = SKTexture(imageNamed: "pan")
    var editTexture = SKTexture(imageNamed: "edit")
    var chosenOneTexture = SKTexture(imageNamed: "StartSprite")
    var isRunningSimulation: Bool = false
    var degreesToTurn = SKLabelNode()
    var degrees = Int()
    var botInstructions = SKLabelNode()
    var botInstructionsBackdrop = SKSpriteNode()
    var compass = SKSpriteNode()
    var compassBack = SKSpriteNode()
    var compassDegrees = Int()
    var compassLabel = SKLabelNode()
    var manager = CLLocationManager()
    var c: Bool = true
    var c2: Bool = false
    var c3: Bool = false
    var c4: Bool = false
    var c5: Bool = false
    var c6: Bool = false
    var c7: Bool = false
    var c8: Bool = false
    var c9: Bool = false
    var c10: Bool = false
    var c11: Bool = false
    var c12: Bool = false
    var c13: Bool = false
    var c14: Bool = false
    var c15: Bool = false
    var c16: Bool = false
    var d: Bool = false
    var d2: Bool = false
    var d3: Bool = false
    var d4: Bool = false
    var d5: Bool = false
    var d6: Bool = false
    var d7: Bool = false
    var d8: Bool = false
    var d9: Bool = false
    var d10: Bool = false
    var d11: Bool = false
    var d12: Bool = false
    var d13: Bool = false
    var d14: Bool = false
    var d15: Bool = false
    var d16: Bool = false
    var lb = false
    var orientToPoint = SKAction()
    var orientToPoint2 = SKAction()
    var orientToPoint3 = SKAction()
    var orientToPoint4 = SKAction()
    var orientToPoint5 = SKAction()
    var orientToPoint6 = SKAction()
    var orientToPoint7 = SKAction()
    var orientToPoint8 = SKAction()
    var orientToPoint9 = SKAction()
    var orientToPoint10 = SKAction()
    var orientToPoint11 = SKAction()
    var orientToPoint12 = SKAction()
    var orientToPoint13 = SKAction()
    var orientToPoint14 = SKAction()
    var orientToPoint15 = SKAction()
    var orientToPoint16 = SKAction()
    var duration = CFTimeInterval()
    var duration2 = CFTimeInterval()
    var duration3 = CFTimeInterval()
    var duration4 = CFTimeInterval()
    var duration5 = CFTimeInterval()
    var duration6 = CFTimeInterval()
    var duration7 = CFTimeInterval()
    var duration8 = CFTimeInterval()
    var duration9 = CFTimeInterval()
    var duration10 = CFTimeInterval()
    var duration11 = CFTimeInterval()
    var duration12 = CFTimeInterval()
    var duration13 = CFTimeInterval()
    var duration14 = CFTimeInterval()
    var duration15 = CFTimeInterval()
    var duration16 = CFTimeInterval()
    var didRun = false
    var didRun2 = false
    var currentSimulatingPoints: Int = 0
    var isGoingThere = false
    var isComingBack = false
    var cdegrees: Int = 0
    var restCommandWasSent = false
    var forwardCommandWasSent = false
    var leftCommandWasSent = false
    var rightCommandWasSent = false
    var flipee: SKAction!
    var debugPrint: SKAction!
    var pointList: [SKSpriteNode] = []
    
    
    
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = .white
        
        BirdCamera = SKCameraNode()
        self.camera = BirdCamera
        self.addChild(BirdCamera)
        
        //        point = addPointToScreen(sceneTo: self, position: CGPoint(x: 125, y: 250))
        //        point.texture = chosenOneTexture
        //        point2 = addPointToScreen(sceneTo: self, position: CGPoint(x: 250, y: 250))
        //        point3 = addPointToScreen(sceneTo: self, position: CGPoint(x: 250, y: 125))
        //        point4 = addPointToScreen(sceneTo: self, position: CGPoint(x: 250, y: 0))
        //        point5 = addPointToScreen(sceneTo: self, position: CGPoint(x: 250, y: -125))
        //        point6 = addPointToScreen(sceneTo: self, position: CGPoint(x: 250, y: -250))
        //        point7 = addPointToScreen(sceneTo: self, position: CGPoint(x: 125, y: -250))
        //        point8 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: -250))
        //        point9 = addPointToScreen(sceneTo: self, position: CGPoint(x: -125, y: -250))
        //        point10 = addPointToScreen(sceneTo: self, position: CGPoint(x: -250, y: -250))
        //        point11 = addPointToScreen(sceneTo: self, position: CGPoint(x: -250, y: -125))
        //        point12 = addPointToScreen(sceneTo: self, position: CGPoint(x: -250, y: 0))
        //        point13 = addPointToScreen(sceneTo: self, position: CGPoint(x: -250, y: 125))
        //        point14 = addPointToScreen(sceneTo: self, position: CGPoint(x: -250, y: 250))
        //        point15 = addPointToScreen(sceneTo: self, position: CGPoint(x: -125, y: 250))
        //        point16 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 250))
        
        
        point = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 200))
        point.texture = chosenOneTexture
        point2 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 400))
        point3 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 600))
        point4 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 800))
        point5 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 1000))
        point6 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 1200))
        point7 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 1400))
        point8 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 1600))
        point9 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 1800))
        point10 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 2000))
        point11 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 2200))
        point12 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 2400))
        point13 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 2600))
        point14 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 2800))
        point15 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 3000))
        point16 = addPointToScreen(sceneTo: self, position: CGPoint(x: 0, y: 3200))
        
        line = addLineToScreen(sceneTo: self, startPoint: point.position, endPoint: point2.position, resetNode: line, color: .black)
        line2 = addLineToScreen(sceneTo: self, startPoint: point2.position, endPoint: point3.position, resetNode: line2, color: .black)
        line3 = addLineToScreen(sceneTo: self, startPoint: point3.position, endPoint: point4.position, resetNode: line3, color: .black)
        line4 = addLineToScreen(sceneTo: self, startPoint: point4.position, endPoint: point5.position, resetNode: line4, color: .black)
        line5 = addLineToScreen(sceneTo: self, startPoint: point5.position, endPoint: point6.position, resetNode: line5, color: .black)
        line6 = addLineToScreen(sceneTo: self, startPoint: point6.position, endPoint: point7.position, resetNode: line6, color: .black)
        line7 = addLineToScreen(sceneTo: self, startPoint: point7.position, endPoint: point8.position, resetNode: line7, color: .black)
        line8 = addLineToScreen(sceneTo: self, startPoint: point8.position, endPoint: point9.position, resetNode: line8, color: .black)
        line9 = addLineToScreen(sceneTo: self, startPoint: point9.position, endPoint: point10.position, resetNode: line9, color: .black)
        line10 = addLineToScreen(sceneTo: self, startPoint: point10.position, endPoint: point11.position, resetNode: line10, color: .black)
        line11 = addLineToScreen(sceneTo: self, startPoint: point11.position, endPoint: point12.position, resetNode: line11, color: .black)
        line12 = addLineToScreen(sceneTo: self, startPoint: point12.position, endPoint: point13.position, resetNode: line12, color: .black)
        line13  = addLineToScreen(sceneTo: self, startPoint: point13.position, endPoint: point14.position, resetNode: line13, color: .black)
        line14 = addLineToScreen(sceneTo: self, startPoint: point14.position, endPoint: point15.position, resetNode: line14, color: .black)
        line15 = addLineToScreen(sceneTo: self, startPoint: point15.position, endPoint: point16.position, resetNode: line15, color: .black)
        
        wrath = addWRATH(sceneTo: self, position: CGPoint(x: 0, y: 0))
        
        let buttonY = BirdCamera.position.y - 575
        editButton = addButton(sceneTo: self, position: CGPoint(x: -160, y: buttonY), scale: 0.6, texture: "EditMap")
        runButton = addButton(sceneTo: self, position: CGPoint(x: 180, y: buttonY), scale: 0.75, texture: "RunMap")
        clearButton = addButton(sceneTo: self, position: CGPoint(x: 0, y: buttonY), scale: 0.45, texture: "ClearMap")
        buttonBackdrop = addButton(sceneTo: self, position: CGPoint(x: 0, y: buttonY - 150), scale: 1, texture: "ABBD")
        buttonBackdrop.zPosition = 0
        
        pan = addButton(sceneTo: self, position: CGPoint(x: 300, y: 600), scale: 0.1, texture: "edit")
        pan.texture = editTexture
        pan.zPosition = 50
        
        degreesToTurn = addLabel(scene: self, position: CGPoint(x: -250, y: 600), size: 25.0, text: "dgrs: \(degrees)")
        
        botInstructions = addLabel(scene: self, position: CGPoint(x: 0, y: 500), size: 50.0, text: "rest")
        botInstructions.zPosition = 50
        botInstructionsBackdrop = addButton(sceneTo: self, position: CGPoint(x: 0, y: 550), scale: 1, texture: "ABBE")
        botInstructionsBackdrop.zPosition = 25
        
        compassDegrees = 0
        compassLabel = addLabel(scene: self, position: CGPoint(x: -250, y: 500), size: 25.0, text: "cdgs: 0")
        compassLabel.zPosition = 50
        compassBack = addButton(sceneTo: self, position: CGPoint(x: -150, y: 500), scale: 0.05, texture: "CompassBack")
        compassBack.zPosition = 40
        compass = addButton(sceneTo: self, position: CGPoint(x: -150, y: 500), scale: 0.05, texture: "CompassArrow")
        compass.zPosition = 50
        
        manager.delegate = self
        manager.startUpdatingHeading()
        
        flipee = SKAction.run{self.didRun2 = true}
        debugPrint = SKAction.run{print("switched didRun2 to \(self.didRun2)")}
        
        pointList.append(contentsOf: [point, point2, point3, point4, point5, point6, point7, point8, point9, point10, point11, point12, point13, point14, point15, point16])
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(closePage))
        self.view!.addGestureRecognizer(pinchGesture)
      
    }
    
    @objc func closePage(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GameViewController")
        vc.view.frame = (self.view?.frame)!
        vc.view.layoutIfNeeded()
        UIView.transition(with: self.view!, duration: 0.3, options: .transitionFlipFromRight, animations:
                            {
            self.view?.window?.rootViewController = vc
        }, completion: { completed in
        })
    }
    
    func returnWrathToStart(){
        if isRunningSimulation == false{
            wrath.run(SKAction.move(to: CGPoint(x: point.position.x, y: point.position.y), duration: 0.5))
            BirdCamera.run(SKAction.move(to: CGPoint(x: point.position.x, y: point.position.y), duration: 0.5))
        }
    }
    
    func addLabel(scene: SKScene, position: CGPoint, size: CGFloat, text: String) -> SKLabelNode{
        let label = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        label.position = position
        label.fontSize = size
        label.fontColor = .black
        label.text = text
        label.zPosition = 100
        scene.addChild(label)
        
        return label
    }
    
    func addPointToScreen(sceneTo: SKScene, position: CGPoint) -> SKSpriteNode{
        let point = SKSpriteNode(imageNamed: "PointSprite")
        point.position = position
        point.setScale(0.5)
        point.zPosition = 0
        sceneTo.addChild(point)
        
        return point
    }
    
    func addButton(sceneTo: SKScene, position: CGPoint, scale: CGFloat, texture: String) -> SKSpriteNode{
        let element = SKSpriteNode(imageNamed: texture)
        element.position = position
        element.setScale(scale)
        element.zPosition = 1
        sceneTo.addChild(element)
        
        return element
    }
    
    func addLineToScreen(sceneTo: SKScene, startPoint: CGPoint, endPoint: CGPoint, resetNode: SKShapeNode, color: UIColor) -> SKShapeNode{
        resetNode.removeFromParent()
        let line = SKShapeNode()
        let path = CGMutablePath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        line.path = path
        line.strokeColor = color
        line.lineWidth = 15
        sceneTo.addChild(line)
        
        return line
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let position = touch.location(in: self)
            OGLocation = position
            Xdif = 0
            Ydif = 0
            if editButton.contains(position){
                isRunTheDominantButton = true
                isEditingPath = true
                failSafe = false
                runButton.setScale(0.75)
                editButton.setScale(0.6)
                wrath.removeAllActions()
                isRunningSimulation = false
                lb = false
                c = true
                c2 = false
                c3 = false
                c4 = false
                c5 = false
                c6 = false
                c7 = false
                c8 = false
                c9 = false
                c10 = false
                c11 = false
                c12 = false
                c13 = false
                c14 = false
                c15 = false
                c16 = false
                d = false
                d2 = false
                d3 = false
                d4 = false
                d5 = false
                d6 = false
                d7 = false
                d8 = false
                d9 = false
                d10 = false
                d11 = false
                d12 = false
                d13 = false
                d14 = false
                d15 = false
                d16 = false
                isComingBack = false
                isGoingThere = false
                didRun = false
                didRun2 = false
                currentSimulatingPoints = 0
                botInstructions.text = "rest"
            }
            
            if runButton.contains(position){
                isRunTheDominantButton = false
                isEditingPath = false
                editButton.setScale(0.75)
                runButton.setScale(0.6)
                isGoingThere = true
                returnWrathToStart()
            }
            
            if clearButton.contains(position){
                point.position = CGPoint(x: 125, y: 250)
                point2.position = CGPoint(x: 250, y: 250)
                point3.position = CGPoint(x: 250, y: 125)
                point4.position = CGPoint(x: 250, y: 0)
                point5.position = CGPoint(x: 250, y: -125)
                point6.position = CGPoint(x: 250, y: -250)
                point7.position = CGPoint(x: 125, y: -250)
                point8.position = CGPoint(x: 0, y: -250)
                point9.position = CGPoint(x: -125, y: -250)
                point10.position = CGPoint(x: -250, y: -250)
                point11.position = CGPoint(x: -250, y: -125)
                point12.position = CGPoint(x: -250, y: 0)
                point13.position = CGPoint(x: -250, y: 125)
                point14.position = CGPoint(x: -250, y: 250)
                point15.position = CGPoint(x: -125, y: 250)
                point16.position = CGPoint(x: 0, y: 250)
                
                line = addLineToScreen(sceneTo: self, startPoint: point.position, endPoint: point2.position, resetNode: line, color: .black)
                line2 = addLineToScreen(sceneTo: self, startPoint: point2.position, endPoint: point3.position, resetNode: line2, color: .black)
                line3 = addLineToScreen(sceneTo: self, startPoint: point3.position, endPoint: point4.position, resetNode: line3, color: .black)
                line4 = addLineToScreen(sceneTo: self, startPoint: point4.position, endPoint: point5.position, resetNode: line4, color: .black)
                line5 = addLineToScreen(sceneTo: self, startPoint: point5.position, endPoint: point6.position, resetNode: line5, color: .black)
                line6 = addLineToScreen(sceneTo: self, startPoint: point6.position, endPoint: point7.position, resetNode: line6, color: .black)
                line7 = addLineToScreen(sceneTo: self, startPoint: point7.position, endPoint: point8.position, resetNode: line7, color: .black)
                line8 = addLineToScreen(sceneTo: self, startPoint: point8.position, endPoint: point9.position, resetNode: line8, color: .black)
                line9 = addLineToScreen(sceneTo: self, startPoint: point9.position, endPoint: point10.position, resetNode: line9, color: .black)
                line10 = addLineToScreen(sceneTo: self, startPoint: point10.position, endPoint: point11.position, resetNode: line10, color: .black)
                line11 = addLineToScreen(sceneTo: self, startPoint: point11.position, endPoint: point12.position, resetNode: line11, color: .black)
                line12 = addLineToScreen(sceneTo: self, startPoint: point12.position, endPoint: point13.position, resetNode: line12, color: .black)
                line13  = addLineToScreen(sceneTo: self, startPoint: point13.position, endPoint: point14.position, resetNode: line13, color: .black)
                line14 = addLineToScreen(sceneTo: self, startPoint: point14.position, endPoint: point15.position, resetNode: line14, color: .black)
                line15 = addLineToScreen(sceneTo: self, startPoint: point15.position, endPoint: point16.position, resetNode: line15, color: .black)
            }
            
            if pan.contains(position){
                if pan.texture == editTexture{
                    pan.texture = panTexture
                }else if pan.texture == panTexture{
                    pan.texture = editTexture
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let position = touch.location(in: self)
            if isEditingPath{
                
                checkForTouchOnPoint(pointLinkedBefore: point3, pointToMove: &point, pointLinkedAfter: point2, lineA: &line, lineB: &line2, specialCase: "after", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point, pointToMove: &point2, pointLinkedAfter: point3, lineA: &line, lineB: &line2, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point2, pointToMove: &point3, pointLinkedAfter: point4, lineA: &line2, lineB: &line3, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point3, pointToMove: &point4, pointLinkedAfter: point5, lineA: &line3, lineB: &line4, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point4, pointToMove: &point5, pointLinkedAfter: point6, lineA: &line4, lineB: &line5, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point5, pointToMove: &point6, pointLinkedAfter: point7, lineA: &line5, lineB: &line6, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point6, pointToMove: &point7, pointLinkedAfter: point8, lineA: &line6, lineB: &line7, specialCase: "both", touchPoint: position)
                 
                checkForTouchOnPoint(pointLinkedBefore: point7, pointToMove: &point8, pointLinkedAfter: point9, lineA: &line7, lineB: &line8, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point8, pointToMove: &point9, pointLinkedAfter: point10, lineA: &line8, lineB: &line9, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point9, pointToMove: &point10, pointLinkedAfter: point11, lineA: &line9, lineB: &line10, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point10, pointToMove: &point11, pointLinkedAfter: point12, lineA: &line10, lineB: &line11, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point11, pointToMove: &point12, pointLinkedAfter: point13, lineA: &line11, lineB: &line12, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point12, pointToMove: &point13, pointLinkedAfter: point14, lineA: &line12, lineB: &line13, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point13, pointToMove: &point14, pointLinkedAfter: point15, lineA: &line13, lineB: &line14, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point14, pointToMove: &point15, pointLinkedAfter: point16, lineA: &line14, lineB: &line15, specialCase: "both", touchPoint: position)
                
                checkForTouchOnPoint(pointLinkedBefore: point10, pointToMove: &point16, pointLinkedAfter: point15, lineA: &line15, lineB: &line16, specialCase: "after", touchPoint: position)
                
                if pan.texture == panTexture{
                    Xdif = OGLocation.x - position.x
                    Ydif = OGLocation.y - position.y
                    BirdCamera.position.x += Xdif
                    BirdCamera.position.y += Ydif
                }
            }
        }
    }
    
    func runWrathSimulation(){
        
//
//
//        let moveThere: SKAction = SKAction.sequence([orientToPoint2, delay, SKAction.move(to: point2.position, duration: duration), orientToPoint3, delay, SKAction.move(to: point3.position, duration: duration2), orientToPoint4, delay, SKAction.move(to: point4.position, duration: duration3), orientToPoint5, delay, SKAction.move(to: point5.position, duration: duration4), orientToPoint6, delay, SKAction.move(to: point6.position, duration: duration5), orientToPoint7, delay, SKAction.move(to: point7.position, duration: duration6), orientToPoint8, delay, SKAction.move(to: point8.position, duration: duration7), orientToPoint9, delay, SKAction.move(to: point9.position, duration: duration8), orientToPoint10, delay, SKAction.move(to: point10.position, duration: duration9), orientToPoint11, delay, SKAction.move(to: point11.position, duration: duration10), orientToPoint12, delay, SKAction.move(to: point12.position, duration: duration11), orientToPoint13, delay, SKAction.move(to: point13.position, duration: duration12), orientToPoint14, delay, SKAction.move(to: point14.position, duration: duration13), orientToPoint15, delay, SKAction.move(to: point15.position, duration: duration14), orientToPoint16, delay, SKAction.move(to: point16.position, duration: duration15)])
//
//        let moveBack: SKAction = SKAction.sequence([orientToPoint15, delay, SKAction.move(to: point15.position, duration: duration15), orientToPoint14, delay, SKAction.move(to: point14.position, duration: duration14), orientToPoint13, delay,  SKAction.move(to: point13.position, duration: duration13), orientToPoint12, delay, SKAction.move(to: point12.position, duration: duration12), orientToPoint11, delay, SKAction.move(to: point11.position, duration: duration11), orientToPoint10, delay, SKAction.move(to: point10.position, duration: duration10), orientToPoint9, delay, SKAction.move(to: point9.position, duration: duration9), orientToPoint8, delay, SKAction.move(to: point8.position, duration: duration8), orientToPoint7, delay, SKAction.move(to: point7.position, duration: duration7), orientToPoint6, delay, SKAction.move(to: point6.position, duration: duration6), orientToPoint5, delay, SKAction.move(to: point5.position, duration: duration5), orientToPoint4, delay, SKAction.move(to: point4.position, duration: duration4), orientToPoint3, delay, SKAction.move(to: point3.position, duration: duration3), orientToPoint2, delay, SKAction.move(to: point2.position, duration: duration2), orientToPoint, delay, SKAction.move(to: point.position, duration: duration)])
//
//        let roundTrip = SKAction.sequence([moveThere, moveBack])
//
//        wrath.run(SKAction.repeatForever(roundTrip))
        
        isRunningSimulation = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
   
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        wrath.position = wrath.position
        if wrath.contains(point.position){
            if failSafe == false{
                runWrathSimulation()
            }
            failSafe = true
            wrath.position = point.position
        }
        cdegrees = Int(manager.heading?.magneticHeading ?? 0)
        let cradians = CGFloat((manager.heading?.magneticHeading ?? 0) / 180.0 * .pi)
        compass.zRotation = cradians
        compassLabel.text = "cdgs: \(cdegrees - 180)"
        compass.position = CGPoint(x: BirdCamera.position.x - 150, y: BirdCamera.position.y + 510)
        compassBack.position = CGPoint(x: BirdCamera.position.x - 150, y: BirdCamera.position.y + 510)
        compassLabel.position = CGPoint(x: BirdCamera.position.x - 250, y: BirdCamera.position.y + 500)
        botInstructions.position = CGPoint(x: BirdCamera.position.x, y: BirdCamera.position.y + 500)
        botInstructionsBackdrop.position = CGPoint(x: BirdCamera.position.x, y: BirdCamera.position.y + 730)
        degreesToTurn.position = CGPoint(x: BirdCamera.position.x - 250, y: BirdCamera.position.y + 600)
        degrees = Int((Float(wrath.zRotation) / Float.pi) * -180) - 90
        degreesToTurn.text = "dgrs: \(degrees)"
        if isRunningSimulation == true{
            BirdCamera.position = wrath.position
            
            
            if lb == false{
                orientToPoint = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point.position)}
                orientToPoint2 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point2.position)}
                orientToPoint3 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point3.position)}
                orientToPoint4 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point4.position)}
                orientToPoint5 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point5.position)}
                orientToPoint6 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point6.position)}
                orientToPoint7 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point7.position)}
                orientToPoint8 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point8.position)}
                orientToPoint9 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point9.position)}
                orientToPoint10 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point10.position)}
                orientToPoint11 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point11.position)}
                orientToPoint12 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point12.position)}
                orientToPoint13 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point13.position)}
                orientToPoint14 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point14.position)}
                orientToPoint15 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point15.position)}
                orientToPoint16 = SKAction.run{orientNodeSmoothly(node: self.wrath, toPoint: self.point16.position)}
                
                duration = calculateTimeToTravel(node: point, toPoint: point2)
                duration2 = calculateTimeToTravel(node: point2, toPoint: point3)
                duration3 = calculateTimeToTravel(node: point3, toPoint: point4)
                duration4 = calculateTimeToTravel(node: point4, toPoint: point5)
                duration5 = calculateTimeToTravel(node: point5, toPoint: point6)
                duration6 = calculateTimeToTravel(node: point6, toPoint: point7)
                duration7 = calculateTimeToTravel(node: point7, toPoint: point8)
                duration8 = calculateTimeToTravel(node: point8, toPoint: point9)
                duration9 = calculateTimeToTravel(node: point9, toPoint: point10)
                duration10 = calculateTimeToTravel(node: point10, toPoint: point11)
                duration11 = calculateTimeToTravel(node: point11, toPoint: point12)
                duration12 = calculateTimeToTravel(node: point12, toPoint: point13)
                duration13 = calculateTimeToTravel(node: point13, toPoint: point14)
                duration14 = calculateTimeToTravel(node: point14, toPoint: point15)
                duration15 = calculateTimeToTravel(node: point15, toPoint: point16)
                
                lb = true
            }
            
            let flip: SKAction = SKAction.run{self.c.toggle()}
            let flip2: SKAction = SKAction.run{self.c2.toggle()}
            let flip3: SKAction = SKAction.run{self.c3.toggle()}
            let flip4: SKAction = SKAction.run{self.c4.toggle()}
            let flip5: SKAction = SKAction.run{self.c5.toggle()}
            let flip6: SKAction = SKAction.run{self.c6.toggle()}
            let flip7: SKAction = SKAction.run{self.c7.toggle()}
            let flip8: SKAction = SKAction.run{self.c8.toggle()}
            let flip9: SKAction = SKAction.run{self.c9.toggle()}
            let flip10: SKAction = SKAction.run{self.c10.toggle()}
            let flip11: SKAction = SKAction.run{self.c11.toggle()}
            let flip12: SKAction = SKAction.run{self.c12.toggle()}
            let flip13: SKAction = SKAction.run{self.c13.toggle()}
            let flip14: SKAction = SKAction.run{self.c14.toggle()}
            let flip15: SKAction = SKAction.run{self.c15.toggle()}
            let flip16: SKAction = SKAction.run{self.c16.toggle()}


           if isGoingThere == true{
                
                simulateOnePoint(command: 0, cNumber: &c, dNumber: &d, orientToWhichPoint: orientToPoint2, flipWhich: flip2, pointTo: point2, durationForTravel: duration)
                
                simulateOnePoint(command: 0, cNumber: &c2, dNumber: &d2, orientToWhichPoint: orientToPoint3, flipWhich: flip3, pointTo: point3, durationForTravel: duration2)
                
                simulateOnePoint(command: 0, cNumber: &c3, dNumber: &d3, orientToWhichPoint: orientToPoint4, flipWhich: flip4, pointTo: point4, durationForTravel: duration3)
                
                simulateOnePoint(command: 0, cNumber: &c4, dNumber: &d4, orientToWhichPoint: orientToPoint5, flipWhich: flip5, pointTo: point5, durationForTravel: duration4)
                
                simulateOnePoint(command: 0, cNumber: &c5, dNumber: &d5, orientToWhichPoint: orientToPoint6, flipWhich: flip6, pointTo: point6, durationForTravel: duration5)
                
                simulateOnePoint(command: 0, cNumber: &c6, dNumber: &d6, orientToWhichPoint: orientToPoint7, flipWhich: flip7, pointTo: point7, durationForTravel: duration6)
                
                simulateOnePoint(command: 0, cNumber: &c7, dNumber: &d7, orientToWhichPoint: orientToPoint8, flipWhich: flip8, pointTo: point8, durationForTravel: duration7)
                
                simulateOnePoint(command: 0, cNumber: &c8, dNumber: &d8, orientToWhichPoint: orientToPoint9, flipWhich: flip9, pointTo: point9, durationForTravel: duration8)
                
                simulateOnePoint(command: 0, cNumber: &c9, dNumber: &d9, orientToWhichPoint: orientToPoint10, flipWhich: flip10, pointTo: point10, durationForTravel: duration9)
                
                simulateOnePoint(command: 0, cNumber: &c10, dNumber: &d10, orientToWhichPoint: orientToPoint11, flipWhich: flip11, pointTo: point11, durationForTravel: duration10)
                
                simulateOnePoint(command: 0, cNumber: &c11, dNumber: &d11, orientToWhichPoint: orientToPoint12, flipWhich: flip12, pointTo: point12, durationForTravel: duration11)
                
                simulateOnePoint(command: 0, cNumber: &c12, dNumber: &d12, orientToWhichPoint: orientToPoint13, flipWhich: flip13, pointTo: point13, durationForTravel: duration12)
                
                simulateOnePoint(command: 0, cNumber: &c13, dNumber: &d13, orientToWhichPoint: orientToPoint14, flipWhich: flip14, pointTo: point14, durationForTravel: duration13)
                
                simulateOnePoint(command: 0, cNumber: &c14, dNumber: &d14, orientToWhichPoint: orientToPoint15, flipWhich: flip15, pointTo: point15, durationForTravel: duration14)
                
                simulateOnePoint(command: 1, cNumber: &c15, dNumber: &d15, orientToWhichPoint: orientToPoint16, flipWhich: flip16, pointTo: point16, durationForTravel: duration15)
               
           }
           if isComingBack == true{
               
               simulateOnePoint(command: 0, cNumber: &c16, dNumber: &d16, orientToWhichPoint: orientToPoint15, flipWhich: flip15, pointTo: point15, durationForTravel: duration15)
               
               simulateOnePoint(command: 0, cNumber: &c15, dNumber: &d15, orientToWhichPoint: orientToPoint14, flipWhich: flip14, pointTo: point14, durationForTravel: duration14)
               
               simulateOnePoint(command: 0, cNumber: &c14, dNumber: &d14, orientToWhichPoint: orientToPoint13, flipWhich: flip13, pointTo: point13, durationForTravel: duration13)
               
               simulateOnePoint(command: 0, cNumber: &c13, dNumber: &d13, orientToWhichPoint: orientToPoint12, flipWhich: flip12, pointTo: point12, durationForTravel: duration12)
               
               simulateOnePoint(command: 0, cNumber: &c12, dNumber: &d12, orientToWhichPoint: orientToPoint11, flipWhich: flip11, pointTo: point11, durationForTravel: duration11)
               
               simulateOnePoint(command: 0, cNumber: &c11, dNumber: &d11, orientToWhichPoint: orientToPoint10, flipWhich: flip10, pointTo: point10, durationForTravel: duration10)
               
               simulateOnePoint(command: 0, cNumber: &c10, dNumber: &d10, orientToWhichPoint: orientToPoint9, flipWhich: flip9, pointTo: point9, durationForTravel: duration9)
               
               simulateOnePoint(command: 0, cNumber: &c9, dNumber: &d9, orientToWhichPoint: orientToPoint8, flipWhich: flip8, pointTo: point8, durationForTravel: duration8)
               
               simulateOnePoint(command: 0, cNumber: &c8, dNumber: &d8, orientToWhichPoint: orientToPoint7, flipWhich: flip7, pointTo: point7, durationForTravel: duration7)
               
               simulateOnePoint(command: 0, cNumber: &c7, dNumber: &d7, orientToWhichPoint: orientToPoint6, flipWhich: flip6, pointTo: point6, durationForTravel: duration6)
               
               simulateOnePoint(command: 0, cNumber: &c6, dNumber: &d6, orientToWhichPoint: orientToPoint5, flipWhich: flip5, pointTo: point5, durationForTravel: duration5)
               
               simulateOnePoint(command: 0, cNumber: &c5, dNumber: &d5, orientToWhichPoint: orientToPoint4, flipWhich: flip4, pointTo: point4, durationForTravel: duration4)
               
               simulateOnePoint(command: 0, cNumber: &c4, dNumber: &d4, orientToWhichPoint: orientToPoint3, flipWhich: flip3, pointTo: point3, durationForTravel: duration3)
               
               simulateOnePoint(command: 0, cNumber: &c3, dNumber: &d3, orientToWhichPoint: orientToPoint2, flipWhich: flip2, pointTo: point2, durationForTravel: duration2)
               
               simulateOnePoint(command: 2, cNumber: &c2, dNumber: &d2, orientToWhichPoint: orientToPoint, flipWhich: flip, pointTo: point, durationForTravel: duration)
               
           }

        }
        let buttonY = BirdCamera.position.y - 610
        let buttonX = BirdCamera.position.x
        if isRunTheDominantButton{
            editButton.position = CGPoint(x: buttonX - 200, y: buttonY)
            runButton.position = CGPoint(x: buttonX + 200, y: buttonY)
            clearButton.position = CGPoint(x: buttonX, y: buttonY)
            buttonBackdrop.position = CGPoint(x: buttonX, y: buttonY - 190)
            if pan.texture == editTexture{
                pan.position = CGPoint(x: BirdCamera.position.x + 250, y: BirdCamera.position.y + 600)
            }else{
                pan.position = CGPoint(x: BirdCamera.position.x + 235, y: BirdCamera.position.y + 623)
            }
        }else{
            editButton.position = CGPoint(x: buttonX - 200, y: buttonY)
            runButton.position = CGPoint(x: buttonX + 200, y: buttonY)
            clearButton.position = CGPoint(x: buttonX, y: buttonY)
            buttonBackdrop.position = CGPoint(x: buttonX, y: buttonY - 190)
            if pan.texture == editTexture{
                pan.position = CGPoint(x: BirdCamera.position.x + 250, y: BirdCamera.position.y + 600)
            }else{
                pan.position = CGPoint(x: BirdCamera.position.x + 235, y: BirdCamera.position.y + 623)
            }
        }
        
        switch botInstructions.text{
        case "forward":
            if forwardCommandWasSent == false{
                if isConnectedAndReady{
                    writeV2(commandString: botInstructions.text!, commmandHex: emptyString.data(using: String.Encoding.utf8)!, dataType: "String", characteristics: currentConnectedCharacteristcs, descriptors: currentConnectedDescriptors)
                }
                forwardCommandWasSent = true
                leftCommandWasSent = false
                rightCommandWasSent = false
                restCommandWasSent = false
                print("forward")
            }
        case "rest":
            if restCommandWasSent == false{
                if isConnectedAndReady{
                    writeV2(commandString: botInstructions.text!, commmandHex: emptyString.data(using: String.Encoding.utf8)!, dataType: "String", characteristics: currentConnectedCharacteristcs, descriptors: currentConnectedDescriptors)
                }
                forwardCommandWasSent = false
                leftCommandWasSent = false
                rightCommandWasSent = false
                restCommandWasSent = true
                print("rest")
            }
        case "left":
            if leftCommandWasSent == false{
                if isConnectedAndReady{
                    writeV2(commandString: botInstructions.text!, commmandHex: emptyString.data(using: String.Encoding.utf8)!, dataType: "String", characteristics: currentConnectedCharacteristcs, descriptors: currentConnectedDescriptors)
                }
                forwardCommandWasSent = false
                leftCommandWasSent = true
                rightCommandWasSent = false
                restCommandWasSent = false
                print("left")
            }
        case "right":
            if rightCommandWasSent == false{
                if isConnectedAndReady{
                    writeV2(commandString: botInstructions.text!, commmandHex: emptyString.data(using: String.Encoding.utf8)!, dataType: "String", characteristics: currentConnectedCharacteristcs, descriptors: currentConnectedDescriptors)
                }
                forwardCommandWasSent = false
                leftCommandWasSent = false
                rightCommandWasSent = true
                restCommandWasSent = false
                print("right")
            }
        default:
            break
        }
        
    }
    
    //MARK: SAVE HUNDREDS OF LINES OF CODE
    
    func checkForTouchOnPoint(pointLinkedBefore: SKSpriteNode, pointToMove: inout SKSpriteNode, pointLinkedAfter: SKSpriteNode, lineA: inout SKShapeNode, lineB: inout SKShapeNode, specialCase: String, touchPoint: CGPoint){
        
        var numberPassed = 0
        let numberPassedRequired = 15
        
        var localList = pointList
        
        if let chosenPoint = pointList.firstIndex(of: pointToMove){
            localList.remove(at: chosenPoint)
        }
        
        for localPoint in localList{
            if !localPoint.contains(touchPoint){
                numberPassed += 1
            }
        }
        
        if numberPassed == numberPassedRequired{
            if pointToMove.contains(touchPoint){
                pointToMove.position = touchPoint
                if specialCase == "after"{
                    lineA = addLineToScreen(sceneTo: self, startPoint: pointToMove.position, endPoint: pointLinkedAfter.position, resetNode: lineA, color: .black)
                }
                if specialCase == "before"{
                    lineA = addLineToScreen(sceneTo: self, startPoint: pointLinkedBefore.position, endPoint: pointToMove.position, resetNode: lineA, color: .black)
                }
                if specialCase == "both"{
                    lineA = addLineToScreen(sceneTo: self, startPoint: pointLinkedBefore.position, endPoint: pointToMove.position, resetNode: lineA, color: .black)
                    lineB = addLineToScreen(sceneTo: self, startPoint: pointToMove.position, endPoint: pointLinkedAfter.position, resetNode: lineB, color: .black)
                }
            }
        }
    }
    
    //MARK: ONE OF THE BEST FUNCTIONS I HAVE EVER MADE
    
    func simulateOnePoint(command: Int, cNumber: inout Bool, dNumber: inout Bool, orientToWhichPoint: SKAction, flipWhich: SKAction, pointTo: SKSpriteNode, durationForTravel: CFTimeInterval){
        if cNumber == true{ // current
                if didRun == false{
                    wrath.run(SKAction.sequence([orientToWhichPoint, flipee, debugPrint])) // +1
                    didRun = true
                    print("turned")
                }
                if didRun2 == true {
                    let degreesToReach = findDegrees(fromPoint: wrath.position, toPoint: pointTo.position) * -1
                    
                    if degreesToReach == cdegrees - 180{
                        dNumber = true // current
                        print("aligned")
                        didRun2 = false
                    }
                    if degreesToReach + 180 < cdegrees{
                        botInstructions.text = "left"
                    }
                    if degreesToReach + 180 > cdegrees{
                        botInstructions.text = "right"
                    }
                }
                
                if dNumber == true{ // current
                    wrath.run(SKAction.sequence([SKAction.move(to: pointTo.position, duration: durationForTravel), flipWhich])) // +1, +1
                    cNumber = false //both current
                    dNumber = false
                    didRun = false
                    botInstructions.text = "forward"
                    print("moved")
                    if command == 1{
                        isGoingThere = false
                        isComingBack = true
                    }
                    if command == 2{
                        isGoingThere = true
                        isComingBack = false
                    }
                }
            }
        }
}



//TAKE A HINT
