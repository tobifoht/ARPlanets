//
//  ViewController.swift
//  ARPlanets
//
//  Created by Tobias Foht on 04.10.18.
//  Copyright © 2018 Tobias Foht. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
// Planeten deklarieren
    
    let earth = Planet(radius: 0.2, texture: "art.scnassets/8k_earth_daymap.jpg")
    let moon = Planet(radius: 0.05, texture: "art.scnassets/8k_moon.jpg")
    let mars = Planet(radius: 0.15, texture: "art.scnassets/8k_mars.jpg")
    let sun = Planet(radius: 0.5, texture: "art.scnassets/8k_sun.jpg")
    
    

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
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
    
    
    //    MARK: - Funktionsknöpfe
    
    @IBAction func earthbuttonpressed(_ sender: Any) {
        
        cleanView()
        
        showplanet(planet: earth)
        
    }
    
    @IBAction func moonbuttonpressed(_ sender: Any) {
        
        cleanView()
        
        showplanet(planet: moon)
        
    }
    
    
    @IBAction func marsbuttonpressed(_ sender: Any) {
        
        cleanView()
        
        showplanet(planet: mars)
        
    }
    
    @IBAction func sunbuttonpressed(_ sender: Any) {
        
        cleanView()

        showplanet(planet: sun)
        
    }
    
    @IBAction func trashbuttonpressed(_ sender: Any) {
        
        cleanView()
        
    }
    
    
    //    MARK: - Scene erzeugen und anzeigen
    
    func showplanet(planet: Planet) {
        
        
        let sphere = SCNSphere(radius: planet.big)
        
        let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(named: planet.surface)
        
        sphere.materials = [material]
        
        let node = SCNNode()
        
        node.position = SCNVector3(0, 0.1, -0.5)
        
        node.geometry = sphere
        
        sceneView.scene.rootNode.addChildNode(node)
        
        sceneView.autoenablesDefaultLighting = true
    }
    
    
    
    // MARK: - Anzeigen löschen
    
    func cleanView() {
        
        sceneView.scene.rootNode.enumerateChildNodes { (node, stop) in
            node.removeFromParentNode()
        }
            
    }
    
}
