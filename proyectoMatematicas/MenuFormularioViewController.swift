//
//  MenuFormularioViewController.swift
//  proyectoMatematicas
//
//  Created by Alumno on 10/29/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit

class MenuFormularioViewController: UIViewController {
    
    @IBOutlet weak var btnCirculo: UIButton!
    @IBOutlet weak var btnParabola: UIButton!
    @IBOutlet weak var btnHiperbola: UIButton!
    @IBOutlet weak var btnElipse: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnRegresar(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "circulo"){
            let vistaSig = segue.destination as! FormularioViewController
            vistaSig.labelText = "Círculo"
        }
        else if segue.identifier == "parabola"{
            let vistaSig = segue.destination as! FormularioViewController
            vistaSig.labelText = "Parabola"
        }
        else if segue.identifier == "hiperbola"
        {
            let vistaSig = segue.destination as! FormularioViewController
            vistaSig.labelText = "Hiperbola"
        }
        else if segue.identifier == "elipse"
        {
            let vistaSig = segue.destination as! FormularioViewController
            vistaSig.labelText = "Elipse"
        }
    }
    

}
