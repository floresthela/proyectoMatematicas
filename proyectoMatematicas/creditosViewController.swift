//
//  creditosViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 11/13/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit

class creditosViewController: UIViewController {

    
    @IBOutlet weak var prueba: UILabel!
    /*let myLabel1 = UILabel()
     let myLabel2 = UILabel()
     var subScriptText = "(H£2$) 0.117 kJ/mol"
     var superScriptText = "−1.88·10{−6} cm{3}/mol (298 K)"
     var finalSubScript : NSMutableAttributedString = subScriptText.customText()
     var finalSuperScript : NSMutableAttributedString = superScriptText.customText()
     
     myLabel1.attributedText = finalSubScript
     myLabel2.attributedText = finalSuperScript*/
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func regresaMenu(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
