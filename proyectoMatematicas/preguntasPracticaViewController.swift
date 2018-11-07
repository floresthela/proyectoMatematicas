//
//  preguntasPracticaViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/29/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit

struct Pregunta {
    let pregunta: String
    let opciones: [String]
    let respCorrecta: Int
    let imagen: UIImage?
    let ayuda: String
    let feedback: String
}


class preguntasPracticaViewController: UIViewController {

    @IBOutlet weak var bOpc1: UIButton!
    @IBOutlet weak var bOpc2: UIButton!
    @IBOutlet weak var bOpc3: UIButton!
    @IBOutlet weak var bOpc4: UIButton!
    
    @IBOutlet weak var bTerminarout: UIButton!
    @IBOutlet weak var bAyudaout: UIButton!
    @IBOutlet weak var bSigout: UIButton!
    
    lazy var opciones: [UIButton] = { return [self.bOpc1 , self.bOpc2, self.bOpc3, self.bOpc4] }()
    
    @IBOutlet weak var lbPregunta: UILabel!
    @IBOutlet weak var imagenPregunta: UIImageView!
    
    var seccionConica : String!

    var preguntasCirculo: [Pregunta]! = [
        Pregunta(pregunta: "¿Cuál es el radio del siguiente círculo?", opciones: ["15","5","10","20"], respCorrecta: 2, imagen: UIImage.init(named: "ppCirculo-1"), ayuda: "Recuerda que el radio representa la distancia del centro del circulo a su circunferencia", feedback: "La respuesta es 10, si observas la imagen con atención, el diametro total es de 20, por lo que el radio es la mitad de este"),
        Pregunta(pregunta: "¿Cuál es la ecuación en forma estándar de un círculo con radio 8 y su centro en (0,0)?", opciones: ["x^2 + y^2 = 64","x^2 + y^2 = 8","(x-2)^2+y^2 = 64", "x^2 - y^2 = 8"], respCorrecta: 0, imagen: nil, ayuda: "Recuerda que el radio se eleva al cuadrado. ", feedback: " Cuando el centro es (0,0), la forma estándar se convierte en x^2 + y^2 = r^2."),
        Pregunta(pregunta: "Cuál es la forma estándar de la ecuación de un círculo con el centro en (2,4) y que también contiene el punto (−2,1).", opciones: ["x^2+(y-5)^2 = 25","2x^2 + 4y^2 = 25","x^2 + y^2 = 3","(x-2)^2 + (y-4)^2 = 25"], respCorrecta: 3, imagen: nil, ayuda: "Puedes usar la formula de la distancia para calcular el radio.", feedback: "feedback")
    ]
    var preguntasParabola: [Pregunta]! = [

    ]
    var preguntasElipse: [Pregunta]! = [

    ]
    var preguntasHiperbola: [Pregunta]! = [
        Pregunta(pregunta: "¿Cuál es la ecuación de forma estándar de la hipérbola que tiene vértices  en (0, ± 2) y foco en (0, ± 2 √5)?", opciones: ["y^2/4 + x^2/16 = 1","y^2/4 − x^2/16 = 1","y^2/16 − x^2/4 = 1","y^2/8 − x^2/2 = 1"], respCorrecta: 1, imagen: nil, ayuda: "Los vértices y el foco están en el eje de las x.", feedback: "Los vértices y focos están en el eje x. Por lo tanto, la ecuación para la hipérbola tendrá la forma x^2/a^2 − y^2/b^2  = 1. Resolver para b y sustituir este valor en la ecuacion para obtener la ecuacion en forma estándar."),
        Pregunta(pregunta: "¿Cuál es la ecuación de la siguiente gráfica?", opciones: ["x^2/25 − y^2/4 = 1","x^2/25 + y^2/4 = 1","x^2/5 − y^2/2 = 1","x^2/10 − y^2/2 = 1"], respCorrecta: 0, imagen: UIImage.init(named: "ppHiperbola-1"), ayuda: "falta", feedback: "falta"),
        Pregunta(pregunta: "Encuentra el centro de la siguiente ecuacion: (y+2)^2/9 − (x+1)^2/4 = 1", opciones: ["(0,0)","(2,-1)","(-1,2)","(-1,1)"], respCorrecta: 2, imagen: nil, ayuda: "falta", feedback: "falta")
    ]
    
    var seEquivoco = false
    var indicePregunta: [Int]!
    var indicePreguntaActual = 0
    var ayudas = 2
    var cuenta = 0
    var aMostrar : [Pregunta]!
    
     var colorFondo = UIColor(red: 239/255.0, green: 231/255.0, blue: 218/255.0, alpha: 1)
    
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view1.backgroundColor = colorFondo
        self.view2.backgroundColor = colorFondo
        
        bSigout.isEnabled = false
        bTerminarout.isHidden = true
        
        if seccionConica == "Circulo"{
            indicePregunta = Array(0 ..< preguntasCirculo.count)
            aMostrar = preguntasCirculo
        }
        
        if seccionConica == "Parabola"{
            indicePregunta = Array(0 ..< preguntasParabola.count)
            aMostrar = preguntasParabola
        }
        if seccionConica == "Hiperbola"{
            indicePregunta = Array(0 ..< preguntasHiperbola.count)
            aMostrar = preguntasHiperbola
        }
        if seccionConica == "Elipse"{
            indicePregunta = Array(0 ..< preguntasElipse.count)
            aMostrar = preguntasElipse
        }
        
        aMostrar.shuffle()
        //indicePregunta.shuffle()
        actualiza(indicePregunta: 0)
    }
    
    func actualiza(indicePregunta: Int){
        cuenta += 1
        indicePreguntaActual = indicePregunta
        

        lbPregunta.text = aMostrar[indicePregunta].pregunta
        imagenPregunta.image = aMostrar[indicePregunta].imagen
    bOpc1.setTitle(aMostrar[indicePregunta].opciones[0], for: .normal)
    bOpc2.setTitle(aMostrar[indicePregunta].opciones[1], for: .normal)
    bOpc3.setTitle(aMostrar[indicePregunta].opciones[2], for: .normal)
    bOpc4.setTitle(aMostrar[indicePregunta].opciones[3], for: .normal)
    }
    
    
    @IBAction func seleccionoBoton(button: UIButton) {
        
        let indiceBoton = opciones.index(of: button)
        let preguntaObjecto = aMostrar[indicePregunta[indicePreguntaActual]]
        
        if indiceBoton == preguntaObjecto.respCorrecta{
            opciones[indiceBoton!].backgroundColor = UIColor.green
            bAyudaout.isEnabled = false
            bSigout.isEnabled = true
            bTerminarout.isEnabled = true
            for button in self.opciones {
                button.isEnabled = false
            }
            if seEquivoco == true {
                let mensajeFeedback = aMostrar[indicePreguntaActual].feedback
                let alertaFeedback = UIAlertController(title: "Feedback", message: mensajeFeedback, preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertaFeedback.addAction(restartAction)
                present(alertaFeedback, animated: true, completion: nil)
            }
        }
        else{
           seEquivoco = true
            opciones[indiceBoton!].backgroundColor = UIColor.red
            //bAyudaout.isEnabled = false
        }
    }
    
    
    
    @IBAction func bAyuda(_ sender: UIButton) {
        
        
        if bAyudaout.isEnabled == true{
            ayudas -= 1
        }
        
        
        // muestra mensaje de ayuda
        let mensajeAyuda = aMostrar[indicePreguntaActual].ayuda
        let alertAyuda = UIAlertController(title: "Ayuda", message: mensajeAyuda, preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertAyuda.addAction(restartAction)
        present(alertAyuda, animated: true, completion: nil)
        
        
        // solo se cuenta con # (ayudas) de oportunidades de recibir ayuda
        if ayudas == 0 {
            bAyudaout.isHidden = true
        }
        
        bAyudaout.isEnabled = false
    }
    
    
    @IBAction func bSiguiente(_ sender: UIButton) {

        seEquivoco = false
        bAyudaout.isEnabled = true
        bAyudaout.isEnabled = true
        if cuenta != aMostrar.count{
        actualiza(indicePregunta: indicePreguntaActual+1)
        }
        
        // reseteas el color de los botones
        for i in 0 ..< opciones.count{
            opciones[i].backgroundColor = UIColor.lightGray
        }
        
        if cuenta == aMostrar.count{
            bTerminarout.isHidden = false
            bTerminarout.isEnabled = false
            bSigout.isHidden = true
        }
        
        for button in self.opciones {
            button.isEnabled = true
        }
    
    }
    
    
    
    @IBAction func bTermina(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
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
