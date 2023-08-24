//
//  GameViewController.swift
//  Rosary_Path
//
//  Created by Sebastian Kazakov on 8/1/23.
//

import Foundation
import UIKit
import Swift
import SwiftUI
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, UINavigationControllerDelegate {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("welcome")
        
    }

    @IBAction func BlueTooth(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "BlueToothController")
                
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
                
        present(secondVC, animated: true, completion: nil)
    }
    
    @IBAction func TurnCalibration(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "RotateController")
                
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
                
        present(secondVC, animated: true, completion: nil)
    }
    
    @IBAction func MovementCalibration(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "MoveController")
                
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
                
        present(secondVC, animated: true, completion: nil)
    }
    
    @IBAction func PathMap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "PathViewController")
                
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
                
        present(secondVC, animated: true, completion: nil)
    }
    
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
