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
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    var colorFondo = UIColor(red: 239/255.0, green: 231/255.0, blue: 218/255.0, alpha: 1)
    
    
    @IBOutlet weak var viewFormulario: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var labelText : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewFormulario.backgroundColor = colorFondo
        
        lbTitulo.text = labelText
        scrollView.contentSize = viewFormulario.frame.size
        
        if lbTitulo.text == "Círculo" {
            label1.text = "La ecuación en forma estándar de un círculo con centro en (h,k) y radio r es: "
            img1.image = UIImage(named: "formulaCirculo")
            img2.image = #imageLiteral(resourceName: "1-circulo")

        }
        if lbTitulo.text == "Hiperbola"{
            //img1.image = #imageLiteral(resourceName: "4-hiperbola")
            label1.text = "La forma estándar de la ecuación de una hipérbola con centro (0,0) y eje transversal en el eje x es: "
            img1.image = UIImage(named: "ecuacionHiperbola")
            //label1.text = "La ecuación en forma estándar de una Hiperbola es: "
            label2.text = "La forma estándar de la ecuación de una hipérbola con centro en (0,0) y eje transversal en el eje y es"
            img2.image = UIImage(named: "ecuacionHiperbola2")
        }
        if lbTitulo.text == "Parabola"{
            label1.text = "La ecuación en forma estándar de una parabola con su vértice en (h,k) es: "
            img1.image = UIImage(named: "ecuacionParabola")
            img2.image = #imageLiteral(resourceName: "2-parabola")
        }
        if lbTitulo.text == "Elipse"{
            label1.text = "La ecuación en forma estándar de un elipse con su centro en (0,0) y su eje mayor en el eje x es: "
            img1.image = #imageLiteral(resourceName: "ecuacionElipse1")
            //img2.image = #imageLiteral(resourceName: "elipse2")
            label2.text = "La forma estándar de la ecuación de una elipse con centro en (0,0) y eje mayor en el eje y es:"
            img2.image = UIImage(named: "ecuacionElipse")
        }

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
