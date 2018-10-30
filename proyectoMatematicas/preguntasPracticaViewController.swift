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

    var preguntasPrueba: [Pregunta] = [
        Pregunta(pregunta: "¿Cuál es el radio del siguiente círculo?", opciones: ["1", "4", "5", "6"], respCorrecta: 2, imagen: #imageLiteral(resourceName: "p1"), feedback: "Recuerda que el circulo bla bla bla"),
        Pregunta(pregunta: "¿Cuál es el radio de la siguiente elipse?", opciones: ["20", "100", "10", "50"], respCorrecta: 2, imagen: #imageLiteral(resourceName: "p2"), feedback: "Recuerda que el circulo bla bla bla")
    ]
    
    var preguntasCirculo: [Pregunta] = [
    Pregunta(pregunta: "¿Cuál es el radio del siguiente círculo?", opciones: ["1", "4", "5", "6"], respCorrecta: 1, imagen: nil, feedback: "Recuerda que el circulo bla bla bla")
    ]
    var preguntasParabola: [Pregunta] = [
        Pregunta(pregunta: "¿Pregunta 1?", opciones: ["Parabola", "Hiperbola", "Elipse", "Círculo"], respCorrecta: 0, imagen: nil, feedback: "Recuerda que la parabola bla bla bla")
    ]
    var preguntasElipse: [Pregunta] = [
        Pregunta(pregunta: "¿Pregunta 1?", opciones: ["Parabola", "Hiperbola", "Elipse", "Círculo"], respCorrecta: 0, imagen: nil, feedback: "Recuerda que la parabola bla bla bla")
    ]
    var preguntasHiperbola: [Pregunta] = [
        Pregunta(pregunta: "¿Pregunta 1?", opciones: ["Parabola", "Hiperbola", "Elipse", "Círculo"], respCorrecta: 0, imagen: nil, feedback: "Recuerda que la parabola bla bla bla")
    ]
    
    var indicePregunta: [Int]!
    var indicePreguntaActual = 0
    var ayudas = 2
    var cuenta = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        bTerminarout.isHidden = true
        indicePregunta = Array(0 ..< preguntasPrueba.count)
        indicePregunta.shuffle()
        actualiza(indicePregunta: 0)
    }
    
    func actualiza(indicePregunta: Int){
        cuenta += 1
        indicePreguntaActual = indicePregunta
        
        lbPregunta.text = preguntasPrueba[indicePregunta].pregunta
        imagenPregunta.image = preguntasPrueba[indicePregunta].imagen
    bOpc1.setTitle(preguntasPrueba[indicePregunta].opciones[0], for: .normal)
    bOpc2.setTitle(preguntasPrueba[indicePregunta].opciones[1], for: .normal)
    bOpc3.setTitle(preguntasPrueba[indicePregunta].opciones[2], for: .normal)
    bOpc4.setTitle(preguntasPrueba[indicePregunta].opciones[3], for: .normal)
    }
    
    
    @IBAction func seleccionoBoton(button: UIButton) {
        
        let indiceBoton = opciones.index(of: button)
        let preguntaObjecto = preguntasPrueba[indicePregunta[indicePreguntaActual]]
        
        if indiceBoton == preguntaObjecto.respCorrecta{
            opciones[indiceBoton!].backgroundColor = UIColor.green
        }
        else{
            opciones[indiceBoton!].backgroundColor = UIColor.red
        }
    }
    
    
    
    @IBAction func bAyuda(_ sender: UIButton) {
        
        ayudas -= 1
        
        // mostrar mensajillo pa ayudar
        
        
        // solo se cuenta con # (ayudas) de oportunidades de recibir ayuda
        if ayudas == 0 {
            bAyudaout.isHidden = true
        }
    }
    
    
    @IBAction func bSiguiente(_ sender: UIButton) {

        if cuenta != preguntasPrueba.count{
        actualiza(indicePregunta: indicePreguntaActual+1)
        }
        
        // reseteas el color de los botones
        for i in 0 ..< opciones.count{
            opciones[i].backgroundColor = UIColor.lightGray
        }
        
        if cuenta == preguntasPrueba.count{
            bTerminarout.isHidden = false
            bSigout.isHidden = true
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
