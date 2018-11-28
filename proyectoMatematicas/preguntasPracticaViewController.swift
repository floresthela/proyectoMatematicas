//
//  preguntasPracticaViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/29/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit

// estructura de una pregunta para la sección de práctica
struct Pregunta {
    let pregunta: NSMutableAttributedString
    let opciones: [NSMutableAttributedString]
    let respCorrecta: Int
    let imagen: UIImage?
    let ayuda: NSMutableAttributedString
    let feedback: NSMutableAttributedString
}


class preguntasPracticaViewController: UIViewController {

    
    @IBOutlet weak var navTitulo: UINavigationItem!
    
    @IBOutlet weak var bOpc1: UIButton!
    @IBOutlet weak var bOpc2: UIButton!
    @IBOutlet weak var bOpc3: UIButton!
    @IBOutlet weak var bOpc4: UIButton!
    
    @IBOutlet weak var bTerminarout: UIButton!
    @IBOutlet weak var bAyudaout: UIButton!
    @IBOutlet weak var bSigout: UIButton!
    
    lazy var opciones: [UIButton] = { return [self.bOpc1 , self.bOpc2, self.bOpc3, self.bOpc4] }()
    
    @IBOutlet var tapImagen: UITapGestureRecognizer!
    @IBOutlet weak var lbPregunta: UILabel!
    @IBOutlet weak var imagenPregunta: UIImageView!
    
    var seccionConica : String!

    // preguntas para la sección cónica de círculo
    var preguntasCirculo: [Pregunta]! = [
        Pregunta(pregunta: NSMutableAttributedString(string:"¿Cuál es el radio del siguiente círculo?",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), opciones: [NSMutableAttributedString(string: "15",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]),NSMutableAttributedString(string: "5",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]),NSMutableAttributedString(string:"10" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]),NSMutableAttributedString(string: "20",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])], respCorrecta: 2, imagen: UIImage.init(named: "ppCirculo-1"), ayuda: NSMutableAttributedString(string:"Recuerda que el radio representa la distancia del centro del circulo a su circunferencia" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: NSMutableAttributedString(string: "La respuesta es 10, si observas la imagen con atención, el diametro total es de 20, por lo que el radio es la mitad de este",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])),
        
        Pregunta(pregunta: NSMutableAttributedString(string: "¿Cuál es la ecuación en forma estándar de un círculo con radio 8 y su centro en (0,0)?",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), opciones: ["x{2} + y{2} = 64".customText(),"x{2} + y{2} = 8".customText(),"(x-2){2}+y{2} = 64".customText(), "x{2} - y{2} = 8".customText()], respCorrecta: 0, imagen: nil, ayuda: NSMutableAttributedString(string: "Recuerda que el radio se eleva al cuadrado. ",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: " Cuando el centro es (0,0), la forma estándar se convierte en x{2} + y{2} = r{2}.".customText()),
        
  
        Pregunta(pregunta: NSMutableAttributedString(string:"¿Cuál es la forma estándar de la ecuación de un círculo con el centro en (2,4) y que también contiene el punto (−2,1)?" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), opciones: ["x{2}+(y-5){2} = 25".customText(),"2x{2} + 4y{2} = 25".customText(),"x{2} + y{2} = 3".customText(),"(x-2){2} + (y-4){2} = 25".customText()], respCorrecta: 3, imagen: nil, ayuda: NSMutableAttributedString(string: "Puedes usar la fórmula de la distancia para calcular el radio.",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: "Utiliza la fórmula de la distancia: r = √((x2−x1){2} + (y2−y1){2}) para obtener el radio sustituyendo los valores de los puntos dados en esta formula".customText()),
        
        Pregunta(pregunta: "¿Cuál es el radio de la siguiente ecuación? x{2}+y{2}+8y=0".customText(), opciones: [NSMutableAttributedString(string: "2",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]),NSMutableAttributedString(string:"8" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]),NSMutableAttributedString(string: "10",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]) ,NSMutableAttributedString(string: "4",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])], respCorrecta: 3, imagen: nil, ayuda: NSMutableAttributedString(string:"Recuerda completar el cuadrado de la ecuación para poder sacar el radio. " ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: NSMutableAttributedString(string:"Se tienen que agrupar los término de X y Y para poder completar el cuadrado y obtener el radio. " ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])),
        
        Pregunta(pregunta: NSMutableAttributedString(string: "¿Cuál es el radio de la siguiente ecuación?",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), opciones: [NSMutableAttributedString(string:"3" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]),NSMutableAttributedString(string: "2",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]) , NSMutableAttributedString(string:"5" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "6",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])], respCorrecta: 0, imagen: UIImage.init(named:"practica3"), ayuda: NSMutableAttributedString(string:"Recuerda que el radio se eleva al cuadrado. " ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: NSMutableAttributedString(string: "Si observas la imagen con atención, te podrás dar cuenta de que el diametro es 6, por lo que el radio es la mitad de este. ",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])),
       
        Pregunta(pregunta: "Encuentra el centro del siguiente círculo: (x−3){2}+(y+4){2}=4".customText(), opciones: [NSMutableAttributedString(string:"(3,4)" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]),NSMutableAttributedString(string:"(3,-4)" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string:"(-3,4)" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "(0,1)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])], respCorrecta: 1, imagen: UIImage.init(named:"practica4"), ayuda: NSMutableAttributedString(string: "Recuerda que el centro del círculo se encuentra en (h,k).",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: NSMutableAttributedString(string: "El centro se encuentra en el punto (3,4)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]))
    ]
    
    // preguntas para la sección cónica de parábola
    var preguntasParabola: [Pregunta]! = [
        Pregunta(pregunta: "¿Cuál es la ecuación en forma estándar de la siguiente expresión:  y=3x{2}−6x+5?".customText(), opciones: ["y=3(x−1){2}+2".customText(), "y=3(x−1){2}".customText(), "y=3x{2}+1".customText(), "y=3x{2}+6".customText()], respCorrecta: 0, imagen: nil, ayuda: NSMutableAttributedString(string: "Recuerda completar el cuadrado cuando pases la ecuación a forma estándar",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: "Reescribe la función en y = a (x − h) {2} + k completando el cuadrado.".customText()),

        Pregunta(pregunta: NSMutableAttributedString(string:"¿Cuál es la ecuación de la parábola con foco en (−1/2,0) y directriz x = 1/2?" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), opciones: ["y{2}=2x".customText(),"y{2}=−2x".customText(), "y{2}=2x+1".customText(), "y{2}=x".customText()], respCorrecta: 1, imagen: nil, ayuda: "La forma de la ecuación de la parábola es  y{2}=4px".customText(), feedback: "El foco tiene la forma (p, 0), por lo que la ecuación tendrá la forma y{2} = 4px.".customText()),
        
        Pregunta(pregunta: "Encuentra el eje de simetría de la siguiente ecuación:  y=−x{2}+6x−8 ".customText(), opciones: [NSMutableAttributedString(string: "4",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "10",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "3",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "5",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])], respCorrecta: 2, imagen: nil, ayuda: NSMutableAttributedString(string: "Recuerda la fórmula para obtener el eje de simetría. ",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: NSMutableAttributedString(string: "La ecuación para calcular el eje de simetría es: x = − b / 2a",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])),
        
    
        Pregunta(pregunta: NSMutableAttributedString(string: "¿Cuál es la ecuación de la siguiente gráfica?",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), opciones: ["y{2}= 16x".customText(),"y{2}= −16x".customText(), "y{2}= −8x".customText(), "y{2}= 6x".customText()], respCorrecta: 1, imagen: UIImage.init(named:"practica2"), ayuda: NSMutableAttributedString(string: "Recuerda identificar para qué lado abre la parábola. ",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: NSMutableAttributedString(string: "Establece 4p igual al coeficiente de x en la ecuación dada para resolver para p. Si p> 0, la parábola se abre a la derecha. Si p <0, la parábola se abre a la izquierda.",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])),
        
        Pregunta(pregunta: NSMutableAttributedString(string:"¿Cuál es la ecuación de la parábola con foco en (0, 7/2) y directriz x = -7/2?" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), opciones: ["x{2} = 14y".customText(), "x{2} = -14y".customText(), "x{2} = 7y".customText(), "x{2} = 2y".customText()], respCorrecta: 0, imagen: nil, ayuda: "La forma de la ecuación de la parábola es  x{2} = 4py".customText(), feedback: "El foco tiene la forma (0,p), por lo que la ecuación tendrá la forma y{2} = 4px.".customText())

    ]
    
    // preguntas para la sección cónica de elipse
    var preguntasElipse: [Pregunta]! = [
        Pregunta(pregunta: "¿Cuál es el centro de la siguiente ecuación? (x−3){2}/9 + (y−1){2}/4 = 1".customText(), opciones: [NSMutableAttributedString(string:"(1,1)" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "(3,1)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "(9,4)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "(4,9)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])] , respCorrecta: 1, imagen: nil, ayuda:NSMutableAttributedString(string: "Recuerda despejar los valores de a y b",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]) , feedback:NSMutableAttributedString(string:"Depejando a y b se obtiene que el centro de la ecuación es (3,1)" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]) ),
        
        
        Pregunta(pregunta: "Encuentra las coordenadas del foco de la siguiente ecuacion: x{2}/9 + y{2}/25 = 1".customText(), opciones: [NSMutableAttributedString(string:"(0, ±4)" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "(0, ±2)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "(0, ±5)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "(0, ±9)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])], respCorrecta: 0, imagen: nil, ayuda: NSMutableAttributedString(string:"Recuerda que el foco y los vértices estan relacionados mediante una ecuación." ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: "La ecuación para encontrar el foco es: c{2}= a{2} − b{2}. En este caso a{2} = 9 y b{2} = 25. ".customText()),
         
        Pregunta(pregunta: NSMutableAttributedString(string: "¿Cuál es la ecuación en forma estándar de un elipse que tiene vértices en (± 8,0) y foco en (± 5,0)?",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), opciones: ["x{2}/8 + y{2}/5 = 1".customText(), "x{2}/39 + y{2}/364 = 1".customText(), "x{2}/5 + y{2}/8 = 1".customText(),"x{2}/64 + y{2}/39 = 1".customText()], respCorrecta: 3, imagen: nil, ayuda: NSMutableAttributedString(string: "El foco está en el eje yx por lo tanto el eje mayor es el eje x.",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: "El foco está en el eje x, por lo que el eje mayor es el eje x. Así que, la ecuación tendrá la forma. x{2}/a{2} + y{2}/b{2} = 1. Los vértices y los focos están relacionados por la ecuación c{2} = a{2} − b{2}. Resolver para b y sustituir la ecuación. ".customText()),
        
        Pregunta(pregunta: NSMutableAttributedString(string:"¿Cuál es la ecuación de la siguiente gráfica?" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), opciones: ["x{2}/4 + y{2}/9 = 1".customText(), "x{2}/3 + y{2}/9 = 1".customText(), "x{2}/4 + y{2}/9 = 1".customText(), "x{2}/9 + y{2}/4 = 1".customText()], respCorrecta: 0, imagen: UIImage.init(named:"practica1"), ayuda: NSMutableAttributedString(string: "Recuerda verificar cuál es el eje mayor y cuál es el eje menor.",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: "Como 9 > 4 y el 9 se encuentra en el termino 'y', el eje mayor es vertical. b{2} = 9, entonces b = ±3, entonces los puntos del eje mayor son (0,3) (0,-3). Como a{2} = 4, entonces los puntos del eje menos son (2,0) (-2,0)".customText())

    ]
    
    // preguntas para la sección cónica de hiperbola
    var preguntasHiperbola: [Pregunta]! = [
        Pregunta(pregunta: NSMutableAttributedString(string: "¿Cuál es la ecuación de forma estándar de la hipérbola que tiene vértices  en (0, ± 2) y foco en (0, ± 2 √5)?",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), opciones: ["y{2}/4 + x{2}/16 = 1".customText(),"y{2}/4 − x{2}/16 = 1".customText(),"y{2}/16 − x{2}/4 = 1".customText(),"y{2}/8 − x{2}/2 = 1".customText()], respCorrecta: 1, imagen: nil, ayuda: NSMutableAttributedString(string: "Los vértices y el foco están en el eje de las x.",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: "Los vértices y focos están en el eje x. Por lo tanto, la ecuación para la hipérbola tendrá la forma x{2}/a{2} − y{2}/b{2}  = 1. Resolver para b y sustituir este valor en la ecuacion para obtener la ecuación en forma estándar.".customText()),
        
       
        Pregunta(pregunta: NSMutableAttributedString(string: "¿Cuál es la ecuación de la siguiente gráfica?",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), opciones: ["x{2}/25 − y{2}/4 = 1".customText(),"x{2}/25 + y{2}/4 = 1".customText(),"x{2}/5 − y{2}/2 = 1".customText(),"x{2}/10 − y{2}/2 = 1".customText()], respCorrecta: 0, imagen: UIImage.init(named: "ppHiperbola-1"), ayuda: NSMutableAttributedString(string: "Identifica los vértices y el eje transversal de la ecuación.",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: NSMutableAttributedString(string: "Las coordenadas de los vértices son (-5,0) y (5,0)." ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])),
        
       
        Pregunta(pregunta: "Encuentra el centro de la siguiente ecuación: (y+2){2}/9 − (x+1){2}/4 = 1".customText(), opciones: [NSMutableAttributedString(string: "(0,0)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]),NSMutableAttributedString(string: "(2,-1)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]),NSMutableAttributedString(string: "(-1,-2)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]),NSMutableAttributedString(string: "(-1,1)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])], respCorrecta: 2, imagen: nil, ayuda: NSMutableAttributedString(string: "El centro se encuentra en (h,k). ",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: NSMutableAttributedString(string: "Las coordenadas del centro se obtienen despejando x y de la ecuación dada",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])),
        
        Pregunta(pregunta: "¿Cuáles son las coordenadas del vértice de la ecuación: 4y{2} - 16x{2} = 64?".customText(), opciones: [NSMutableAttributedString(string:"(0, -4) (0,4)" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "(0, 8) (0,-8)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string: "(0, 4) (0,-4)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), NSMutableAttributedString(string:"(0, -16) (0,4)" ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black])], respCorrecta: 0, imagen: nil, ayuda: NSMutableAttributedString(string:"Primero convierte la ecuación a forma estándar y después identifica en qué eje se encuentra el vértice de la ecuación." ,attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]), feedback: NSMutableAttributedString(string: "El vértice de la ecuación se encuentra en el eje y, entonces el vértice tiene forma de (0,-a) y (0,a)",attributes:  [NSAttributedString.Key.foregroundColor: UIColor.black]))
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
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var btnAyuda: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAyuda.backgroundColor = UIColor(red: 197/255, green: 0/255, blue: 0/255, alpha: 1)
        self.view1.backgroundColor = colorFondo
        self.view2.backgroundColor = colorFondo
        
        
        bSigout.isEnabled = false
        bTerminarout.isHidden = true
        
        if seccionConica == "Circulo"{
            navTitulo.title = "Círculo"
            indicePregunta = Array(0 ..< preguntasCirculo.count)
            aMostrar = preguntasCirculo
        }
        
        if seccionConica == "Parabola"{
            navTitulo.title = "Parábola"
            indicePregunta = Array(0 ..< preguntasParabola.count)
            aMostrar = preguntasParabola
        }
        if seccionConica == "Hiperbola"{
            navTitulo.title = "Hiperbola"
            indicePregunta = Array(0 ..< preguntasHiperbola.count)
            aMostrar = preguntasHiperbola
        }
        if seccionConica == "Elipse"{
            navTitulo.title = "Elipse"
            indicePregunta = Array(0 ..< preguntasElipse.count)
            aMostrar = preguntasElipse
        }
        
        // para que las preguntas se muestren en diferente orden cada vez que vuelva a entrar a la práctica
        aMostrar.shuffle()
        actualiza(indicePregunta: 0)
    }
    
    // se actualiza toda la información de la pregunta a desplegar
    func actualiza(indicePregunta: Int){
        
        bSigout.isEnabled = false
        cuenta += 1
        indicePreguntaActual = indicePregunta
        lbPregunta.attributedText = aMostrar[indicePregunta].pregunta
        imagenPregunta.image = aMostrar[indicePregunta].imagen
        
        if imagenPregunta.image == nil {
            tapImagen.isEnabled = false
        }
        else{
            tapImagen.isEnabled = true
        }
    bOpc1.setAttributedTitle(aMostrar[indicePregunta].opciones[0], for: .normal)
    bOpc2.setAttributedTitle(aMostrar[indicePregunta].opciones[1], for: .normal)
    bOpc3.setAttributedTitle(aMostrar[indicePregunta].opciones[2], for: .normal)
    bOpc4.setAttributedTitle(aMostrar[indicePregunta].opciones[3], for: .normal)
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

                let alertaFeedback = UIAlertController(title: "Feedback", message: "", preferredStyle: .alert)
                alertaFeedback.setValue(mensajeFeedback, forKey: "attributedMessage")
                
            
                let restartAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertaFeedback.addAction(restartAction)
                present(alertaFeedback, animated: true, completion: nil)
                
            }
        }
        else{
           seEquivoco = true
            opciones[indiceBoton!].backgroundColor = UIColor.red
            bSigout.isEnabled = false
        }
    }
    
    
    
    @IBAction func bAyuda(_ sender: UIButton) {
        
        
        if bAyudaout.isEnabled == true{
            ayudas -= 1
            // ya no hay límite de ayudas, esto ya no importa
        }
        
        // muestra mensaje de ayuda
        let mensajeAyuda = aMostrar[indicePreguntaActual].ayuda
        
        let alertAyuda = UIAlertController(title: "Ayuda", message: "", preferredStyle: .alert)
        alertAyuda.setValue(mensajeAyuda, forKey: "attributedMessage")
        let restartAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertAyuda.addAction(restartAction)
        present(alertAyuda, animated: true, completion: nil)
        
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
    
 
    // ver la imagen en pantalla completa
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
    
    // quitar la imagen de pantalla completa
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
