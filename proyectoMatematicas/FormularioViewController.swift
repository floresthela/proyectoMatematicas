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
    
    
    @IBOutlet weak var viewFormulario: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var labelText : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbTitulo.text = labelText
        scrollView.contentSize = viewFormulario.frame.size
        //lbTitulo.text = seccionCon.nombre
        
        if lbTitulo.text == "Círculo" {
            img1.image = #imageLiteral(resourceName: "1-circulo")

            label1.text = "La ecuación en forma estándar de un círculo con centro en (0,0)  es: "
        }
        if lbTitulo.text == "Hiperbola"{
            img1.image = #imageLiteral(resourceName: "4-hiperbola")
            label1.text = "La ecuación en forma estándar de una Hiperbola es: "
        }
        if lbTitulo.text == "Parabola"{
            img1.image = #imageLiteral(resourceName: "2-parabola")
            label1.text = "La ecuación en forma estándar de una parabola es: "
        }
        if lbTitulo.text == "Elipse"{
            label1.text = "La ecuación en forma estándar de un elipse con su centro en (0,0) y su eje mayor en el eje x es: "
            img1.image = #imageLiteral(resourceName: "ecuacionElipse1")
            img2.image = #imageLiteral(resourceName: "elipse2")
            
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
