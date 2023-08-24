//
//  MoveScene.swift
//  Rosary_Path
//
//  Created by Sebastian Kazakov on 8/2/23.
//

import Foundation
import SpriteKit

class MoveScene: SKScene{
    
    var wrath = SKSpriteNode()
    var degreesAngle = SKLabelNode()
    
    override func didMove(to view: SKView){
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = .white
        
        wrath = addWRATH(sceneTo: self, position: CGPoint(x: 0, y: 0))
        
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
    
    func addLabel(sceneTo: SKScene){
        
    }
    
}
