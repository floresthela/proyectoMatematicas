//
//  GraficaViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/20/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit
import Charts

class GraficaViewController: UIViewController, ChartViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func regresaMenu(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    
    
        
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "graficaCirculo"{
            let vistagraficaCirculo = segue.destination as! graficaCirculoViewController
        }
        if segue.identifier == "graficaParabola"{
            let vistagraficaCirculo = segue.destination as! graficaParabolaViewController
        }
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.            let vistaMorada = segue.destination as! ViewControllerMorada
     
     }
    

}
