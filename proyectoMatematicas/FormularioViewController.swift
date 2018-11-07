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
    @IBOutlet weak var img4: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
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
            label1.text = "Un círculo es todos los puntos en un plano que están a una distancia fija de un punto dado en el plano. El punto dado se llama centro, (h, k), y la distancia fija se llama radio, r, del círculo."
            img4.image = UIImage(named: "descCirculo")
            label2.text = "La forma estándar de la ecuación de un círculo con centro en (0,0) tiene la siguiente forma: "
            img1.image = UIImage(named: "formulaCirculo1")
            label3.text = "La forma estándar de la ecuación de un círculo con centro en (h,k) es:"
            img2.image = UIImage(named: "formaCirculo2")

        }
        if lbTitulo.text == "Hiperbola"{
            //img1.image = #imageLiteral(resourceName: "4-hiperbola")
            label1.text = "Una hipérbola es todos los puntos en un plano donde la diferencia de sus distancias desde dos puntos fijos es constante. Cada uno de los puntos fijos se llama foco de la hipérbola."
            img4.image = UIImage(named: "descHiperbola")
            label2.text = "La forma estándar de la ecuación de una hipérbola con centro en (0,0) puede tener cualquiera de estas dos formas: "
            img1.image = UIImage(named: "formulaHiperbola")
            label3.text = "La forma estándar de la ecuación de una hipérbola con centro en (h,k) puede tener cualquiera de las siguientes formas: "
            img2.image = UIImage(named: "hiperbola2")
        }
        if lbTitulo.text == "Parabola"{
            label1.text = "Una parábola es todos los puntos en un plano que están a la misma distancia de un punto fijo y de una línea fija. El punto fijo se llama el foco, y la línea fija se llama la directriz de la parábola. "
            img4.image = UIImage(named: "descParabola")
            label2.text = "La ecuación general de la parabola tiene la siguiente forma: "
            img1.image = UIImage(named: "formaGeneralParabola")
            label3.text = "La forma estándar de la parabola tiene la siguiente forma: "
            img2.image = UIImage(named: "formaEstandarParabola")
        }
        if lbTitulo.text == "Elipse"{
            label1.text = "Un elipse es todos los puntos de un plano donde la suma de las distancias desde dos puntos fijos es constante. Cada uno de los puntos fijos se llama foco del  elipse. "
            img4.image = UIImage(named: "descElipse")
            label2.text = "La forma estándar de la ecuación de un elipse con centro en (0,0) tiene la siguiente forma:"
            img1.image = UIImage(named: "elipseFormula")
            label3.text = "La forma estándar de la ecuación de un elipse con centro de (h,k) tiene la siguiente forma:"
            img2.image = UIImage(named: "ElipseCentro2")
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
