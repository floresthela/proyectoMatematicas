//
//  PracticaViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/20/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit

class PracticaViewController: UIViewController {

    @IBOutlet weak var btnCirculo: UIButton!
    @IBOutlet weak var btnParabola: UIButton!
    @IBOutlet weak var btnHiperbola: UIButton!
    @IBOutlet weak var btnElipse: UIButton!
    
    @IBAction func regresaMenu(_ sender: UIBarButtonItem) {
          dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
}
