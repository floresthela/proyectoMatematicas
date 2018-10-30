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
    //var seccionCon : ListaSeccionesConicas!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var label1: UILabel!
    
    var labelText : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbTitulo.text = labelText
        
        //lbTitulo.text = seccionCon.nombre
        
        if lbTitulo.text == "Círculo" {
            img1.image = #imageLiteral(resourceName: "1-circulo")
        }
        if lbTitulo.text == "Hiperbola"{
            img1.image = #imageLiteral(resourceName: "4-hiperbola")
        }
        if lbTitulo.text == "Parabola"{
            img1.image = #imageLiteral(resourceName: "2-parabola")
        }
        if lbTitulo.text == "Elipse"{
            label1.text = "La ecuación en forma estándar de un elipse con su centro en (0,0) y su eje mayor en el eje x es: "
            img1.image = UIImage(named: "ecuacionElipse1")
            img2.image = UIImage(named: "elipse2")
            
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
