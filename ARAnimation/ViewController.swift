//
//  ViewController.swift
//  ARAnimation
//
//  Created by Klara Obermaier on 11.06.18.
//  Copyright © 2018 Katharina. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        

        let box = SCNBox(width:0.5, height: 0.1, length: 0.1, chamferRadius:0)
        let boxNode = SCNNode()
        boxNode.geometry = box
        boxNode.scale = SCNVector3(0.2,0.2,0.2)
        boxNode.position = SCNVector3(0,0,-0.2)
        
        
        let human = SCNBox(width:0.02, height: 0.05, length: 0.01, chamferRadius:0)
        let humanNode = SCNNode()
        humanNode.geometry = human
        humanNode.position = SCNVector3(0,0,-0.4)
        
        
        let human2 = SCNBox(width:0.02, height: 0.05, length: 0.01, chamferRadius:0)
        let human2Node = SCNNode()
        human2Node.geometry = human2
        human2Node.position = SCNVector3(0,0,-0.5)
        
        
        
        
        
        let scene = SCNScene()
        scene.rootNode.addChildNode(boxNode)
        scene.rootNode.addChildNode(humanNode)
        scene.rootNode.addChildNode(human2Node)
        
        
        
        
        sceneView.scene = scene
        // Set the view's delegate
        //sceneView.delegate = self
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap(withGestureRecognizer:)) )
        sceneView.addGestureRecognizer(tapGestureRecognizer)
        
        sceneView.showsStatistics = true
    
    
    }
    
    @objc func didTap(withGestureRecognizer recognizer:UIGestureRecognizer){
        let tapLocation = recognizer.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(tapLocation)
        guard let node = hitTestResults.first?.node else{return}
        let action = SCNAction.move(to: SCNVector3(0,0,0), duration: 2)
        node.runAction(action)
        //node.removeFromParentNode()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
