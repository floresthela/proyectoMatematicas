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
    
    
    @IBOutlet weak var btnCirculo: UIButton!
    @IBOutlet weak var btnParabola: UIButton!
    @IBOutlet weak var btnElipse: UIButton!
    @IBOutlet weak var btnHiperbola: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*btnCirculo.backgroundColor = UIColor(red: 250/255.0, green: 121/255.0, blue: 33/255.0, alpha: 1)
        btnParabola.backgroundColor = UIColor(red: 250/255.0, green: 121/255.0, blue: 33/255.0, alpha: 1)
        btnElipse.backgroundColor = UIColor(red: 250/255.0, green: 121/255.0, blue: 33/255.0, alpha: 1)
        btnHiperbola.backgroundColor = UIColor(red: 250/255.0, green: 121/255.0, blue: 33/255.0, alpha: 1)*/
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
        
        if segue.identifier == "graficaElipse"{
            let vistagraficaElipse = segue.destination as! graficaElipseViewController
        }
        
     }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
}
