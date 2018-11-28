//
//  ViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/18/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var boton1: UIButton!
    @IBOutlet weak var boton2: UIButton!
    @IBOutlet weak var boton3: UIButton!
    @IBOutlet weak var boton4: UIButton!
    @IBOutlet var viewMenu: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

}
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
}

