//
//  PracticaViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/20/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit

class PracticaViewController: UIViewController {

    
    @IBAction func regresaMenu(_ sender: UIBarButtonItem) {
          dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    /* if segue.identifier == "graficaCirculo"{
     let vistagraficaCirculo = segue.destination as! graficaCirculoViewController
     }
     if segue.ident*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pracCirculo"{
            let vistaRepaso = segue.destination as! preguntasPracticaViewController
            vistaRepaso.seccionConica = "Circulo"
            
        }
        if segue.identifier == "pracParabola"{
            let vistaRepaso = segue.destination as! preguntasPracticaViewController
            vistaRepaso.seccionConica = "Parabola"
        }
        if segue.identifier == "pracHiperbola"{
            let vistaRepaso = segue.destination as! preguntasPracticaViewController
            vistaRepaso.seccionConica = "Hiperbola"
        }
        if segue.identifier == "pracElipse"{
            let vistaRepaso = segue.destination as! preguntasPracticaViewController
            vistaRepaso.seccionConica = "Elipse"
        }
    }

}
