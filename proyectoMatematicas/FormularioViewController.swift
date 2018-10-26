//
//  FormularioViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/20/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit

class FormularioViewController: UIViewController {

    @IBOutlet weak var lbTitulo: UILabel!
    var seccionCon : ListaSeccionesConicas!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbTitulo.text = seccionCon.nombre
        
        if lbTitulo.text == "Círculo" {
            img1.image = #imageLiteral(resourceName: "1-circulo")
        }
        if lbTitulo.text == "Hiperbole"{
            img1.image = #imageLiteral(resourceName: "4-hiperbola")
        }
        if lbTitulo.text == "Parabola"{
            img1.image = #imageLiteral(resourceName: "2-parabola")
        }
        if lbTitulo.text == "Elipse"{
            img1.image = #imageLiteral(resourceName: "3-elipse")
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
