//
//  PathSCene.swift
//  Rosary_Path
//
//  Created by Sebastian Kazakov on 8/2/23.
//

import Foundation
import SpriteKit
import CoreLocation

class RotateScene: SKScene, CLLocationManagerDelegate{
    
    var wrath = SKSpriteNode()
    var degreesAngle = SKLabelNode()
    var degrees: Int = 0
    var locationManager = CLLocationManager()
    var compassLabel = SKLabelNode()
    var compassDegrees: Int = 0
    var compassNeedle = SKSpriteNode()
    var compassBase = SKSpriteNode()
    var orientTimer = Timer()
    var failSafe: Bool = false
    var directionLabel = SKLabelNode()
    
    override func didMove(to view: SKView){
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = .white
        
        wrath = addWRATH(sceneTo: self, position: CGPoint(x: 0, y: 0))
        wrath.setScale(1.5)
        
        degreesAngle = addLabel(sceneTo: self, position: CGPoint(x: 0, y: -300))
        degreesAngle.fontColor = .red
        
        compassLabel = addLabel(sceneTo: self, position: CGPoint(x: 0, y: -500))
        
        directionLabel = addLabel(sceneTo: self, position: CGPoint(x: 0, y: -400))
        directionLabel.fontColor = .yellow
        directionLabel.text = "rest"
        
        compassBase = addSprite(sceneTo: self, scale: 0.2, texture: "CompassBack", position: CGPoint(x: 0, y: 400))
        compassNeedle = addSprite(sceneTo: self, scale: 0.2, texture: "CompassArrow", position: CGPoint(x: 0, y: 400))
        compassNeedle.zPosition = 1
        
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
        
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
    
    func addLabel(sceneTo: SKScene, position: CGPoint) -> SKLabelNode{
        let label = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        label.zPosition = 0
        label.text = "\(degrees)"
        label.fontSize = 50.0
        label.position = position
        label.fontColor = .black
        sceneTo.addChild(label)
        
        return label
    }
    
    func addSprite(sceneTo: SKScene, scale: CGFloat, texture: String, position: CGPoint) -> SKSpriteNode{
        let element = SKSpriteNode(imageNamed: texture)
        element.position = position
        element.setScale(scale)
        element.zPosition = 0
        sceneTo.addChild(element)
        
        return element
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let position = touch.location(in: self)
            
            degrees = (findDegrees(fromPoint: wrath.position, toPoint: position))
            degreesAngle.text = "\(degrees)"
            let halfPi = CGFloat(Float.pi / 2)
            let wrathDegrees = CGFloat((Double(degrees) / 180.0) * .pi) - halfPi
            wrath.zRotation = wrathDegrees
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: CFTimeInterval){
        let cpsDegrees = Int(locationManager.heading?.magneticHeading ?? 0)
        compassDegrees = cpsDegrees
        compassLabel.text = "\(compassDegrees - 179)"
        let cdegrees = CGFloat((Double(compassDegrees) / 180.0) * .pi)
        compassNeedle.zRotation = cdegrees
        if compassDegrees - 179 > degrees && failSafe == false{
            if isConnectedAndReady == true{
                writeV2(commandString: "left", commmandHex: emptyString.data(using: String.Encoding.utf8)!, dataType: "String", characteristics: currentConnectedCharacteristcs, descriptors: currentConnectedDescriptors)
            }
            print("turn left")
            degreesAngle.fontColor = .red
            failSafe = true
            directionLabel.text = "left"
        }
        
        if compassDegrees - 179 < degrees && failSafe == false{
            if isConnectedAndReady == true{
                writeV2(commandString: "right", commmandHex: emptyString.data(using: String.Encoding.utf8)!, dataType: "String", characteristics: currentConnectedCharacteristcs, descriptors: currentConnectedDescriptors)
            }
            print("turn right")
            degreesAngle.fontColor = .red
            failSafe = true
            directionLabel.text = "right"
        }
        
        if compassDegrees - 179 == degrees{
            if isConnectedAndReady == true{
                writeV2(commandString: "rest", commmandHex: emptyString.data(using: String.Encoding.utf8)!, dataType: "String", characteristics: currentConnectedCharacteristcs, descriptors: currentConnectedDescriptors)
            }
            print("stop")
            degreesAngle.fontColor = .green
            failSafe = false
            directionLabel.text = "rest"
        }
        
    }
    
}
