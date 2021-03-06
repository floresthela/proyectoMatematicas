//
//  FormularioViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/20/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit

class FormularioViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var navTitulo: UINavigationItem!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var viewFormulario: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var seccConic : String!
    var labelText : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollView.contentSize = viewFormulario.frame.size
        
        
        if seccConic == "Círculo" {
            navTitulo.title = "Círculo"
            label1.text = "Un círculo es todos los puntos en un plano que están a una distancia fija de un punto dado en el plano. El punto dado se llama centro, (h, k), y la distancia fija se llama radio, r, del círculo."
            img4.image = UIImage(named: "descCirculo")
            label2.text = "La forma estándar de la ecuación de un círculo con centro en (0,0) tiene la siguiente forma: "
            img1.image = UIImage(named: "ecuacionCirculoFINAL")
            label3.text = "La forma estándar de la ecuación de un círculo con centro en (h,k) es:"
            img2.image = UIImage(named: "ecuacionCirculo2FINAL")

        }
        if seccConic == "Hiperbola"{
    
            navTitulo.title = "Hipérbola"
            label1.text = "Una hipérbola es todos los puntos en un plano donde la diferencia de sus distancias desde dos puntos fijos es constante. Cada uno de los puntos fijos se llama foco de la hipérbola."
            img4.image = UIImage(named: "descHiperbola")
            label2.text = "La forma estándar de la ecuación de una hipérbola con centro en (0,0) puede tener cualquiera de estas dos formas: "
            img1.image = UIImage(named: "ecuacionHiperbolaFINAL")
            label3.text = "La forma estándar de la ecuación de una hipérbola con centro en (h,k) puede tener cualquiera de las siguientes formas: "
            img2.image = UIImage(named: "ecuacionHiperbola2FINAL")
        }
        if seccConic == "Parábola"{
            navTitulo.title = "Parábola"
            label1.text = "Una parábola es todos los puntos en un plano que están a la misma distancia de un punto fijo y de una línea fija. El punto fijo se llama el foco, y la línea fija se llama la directriz de la parábola. "
            img4.image = UIImage(named: "descParabola")
            label2.text = "La ecuación general de la parábola tiene la siguiente forma: "
            img1.image = UIImage(named: "ecuacionParabolaFINAL")
            label3.text = "La forma estándar de la parábola tiene la siguiente forma: "
            img2.image = UIImage(named: "ecuacionParabola2FINAL")
        }
        if seccConic == "Elipse"{
            navTitulo.title = "Elipse"
            label1.text = "Una elipse es todos los puntos de un plano donde la suma de las distancias desde dos puntos fijos es constante. Cada uno de los puntos fijos se llama foco del  elipse. "
            img4.image = UIImage(named: "descElipse")
            label2.text = "La forma estándar de la ecuación de un elipse con centro en (0,0) tiene la siguiente forma:"
            img1.image = UIImage(named: "ecuacionElipseFINAL")
            label3.text = "La forma estándar de la ecuación de un elipse con centro de (h,k) tiene la siguiente forma:"
            img2.image = UIImage(named: "ecuacionElipse2FINAL")
        }
        
    }
    

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
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
