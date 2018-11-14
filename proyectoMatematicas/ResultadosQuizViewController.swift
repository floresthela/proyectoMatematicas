//
//  ResultadosQuizViewController.swift
//  proyectoMatematicas
//
//  Created by Alumno on 31/10/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit

class ResultadosQuizViewController: UIViewController {

    
    @IBOutlet weak var lbResultado: UILabel!
    
    @IBOutlet weak var lbComentario: UITextView!
    
    var resultado: String!
    var comentario: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbResultado.text = resultado
        lbComentario.text = comentario
        

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
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return false
    }

}
