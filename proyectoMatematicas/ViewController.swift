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
    
    
    //var colorFondo = UIColor(red: 17/255.0, green: 93/255.0, blue: 171/255.0, alpha: 1)
    
    @IBOutlet var viewMenu: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.viewMenu.backgroundColor = colorFondo
        boton1.backgroundColor = UIColor(red: 149/255.0, green: 198/255.0, blue: 35/255.0, alpha: 1)
        boton2.backgroundColor = UIColor(red: 149/255.0, green: 198/255.0, blue: 35/255.0, alpha: 1)
        boton3.backgroundColor = UIColor(red: 149/255.0, green: 198/255.0, blue: 35/255.0, alpha: 1)
        boton4.backgroundColor = UIColor(red: 149/255.0, green: 198/255.0, blue: 35/255.0, alpha: 1)
}



}

