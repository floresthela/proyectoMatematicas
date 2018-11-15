//
//  QuizViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/20/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit
import EFImageViewZoom

struct QuestionQuiz{
    let question : String
    let imageQ : UIImage?
    let options : [String]
    let correctAnswer : Int
}
class QuizViewController: UIViewController, EFImageViewZoomDelegate {

    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var lbCounterQ: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var btnNextQuestion: UIButton!
    @IBOutlet weak var btnFinishQuiz: UIButton!
    
   
    
    @IBOutlet weak var btnOptionA: UIButton!
    @IBOutlet weak var btnOptionB: UIButton!
    @IBOutlet weak var btnOptionC: UIButton!
    @IBOutlet weak var btnOptionD: UIButton!
    
    lazy var opciones : [UIButton] = {return [self.btnOptionA, self.btnOptionB, self.btnOptionC, self.btnOptionD]}()
    
    var listaPreguntas : [QuestionQuiz]! = [
        //preguntas círculo
        QuestionQuiz(question: "¿Cuál es el centro del círculo?", imageQ: UIImage.init(named: "quiz1"), options:["(3,-1)","(-1,3)","(-3,-1)", "(3,6)"] , correctAnswer: 1),
        QuestionQuiz(question: "El círculo pasa por el punto (3,6), ¿cuál es su radio?", imageQ: UIImage.init(named: "quiz1"), options: ["5π","raíz 20","5","raíz 20π"], correctAnswer: 2),
        QuestionQuiz(question: "¿Cuál es el centro del círculo?", imageQ: UIImage.init(named: "quiz2"), options: ["(-6,1)","(3,-1)","(-1,-6)","(-1,3)"], correctAnswer: 1),
        QuestionQuiz(question: "El círculo pasa por el punto (-1,-6), ¿cuál es su radio?", imageQ: UIImage.init(named: "quiz2"), options: ["41π","raíz 41","raíz 41 π","2 x raíz 41"], correctAnswer: 1),
        QuestionQuiz(question: "¿Cuál es el centro del círculo?", imageQ: UIImage.init(named: "quiz3"), options: ["(13.4, -2.6)","(12.6, -2.4)","(-2.6, -13.4)","(-13.4, -2.6)"], correctAnswer: 0),
        QuestionQuiz(question: "¿Cuál es el radio del círculo?", imageQ: UIImage.init(named: "quiz3"), options: ["9","2","6","10"], correctAnswer: 3),
        QuestionQuiz(question: "¿Cuál es el centro del círculo?", imageQ: UIImage.init(named: "quiz4"), options: ["(1.6, 9.8)","(-1.6, 9.8)","(-1.6, -9.8)","(1.6, -9.8)"], correctAnswer: 2),
        QuestionQuiz(question: "¿Cuál es el radio del círculo?", imageQ: UIImage.init(named: "quiz4"), options: ["5.1","5","5.5","5.2"], correctAnswer: 0),
        //preguntas elipse
        QuestionQuiz(question: "¿Cuál es el centro de la elipse?", imageQ: UIImage.init(named: "quiz5"), options: ["(0,7)","(0,-7)","(1,7)","(7,1)"], correctAnswer: 1),
        QuestionQuiz(question: "¿Cuáles son los ejes de la elipse?", imageQ: UIImage.init(named: "quiz5"), options: ["Mayor = 9, Menor = 3","Mayor = 7, Menor = 4","Mayor = 9, Menor = 6","Mayor = 8, Menor = 6"], correctAnswer: 0),
        QuestionQuiz(question: "¿Cuál es el centro de la elipse?", imageQ: UIImage.init(named: "quiz6"), options: ["(7,5)","(3,-7)","(-7,-3)","(-7,3)"], correctAnswer: 3),
        QuestionQuiz(question: "¿Cuáles son los ejes de la elipse?", imageQ: UIImage.init(named: "quiz6"), options: ["Mayor = 6, Menor = 3","Mayor = 4, Menor = 2","Mayor = 6, Menor = 2","Mayor = 8, Menor = 6"], correctAnswer: 1),
        QuestionQuiz(question: "¿Cuáles son los focos de la elipse?", imageQ: UIImage.init(named: "quiz7"), options: ["(12,18) y (12,-12)","(3,27) y (3,-3)","(27,3) y (-3,3)","(18,12) y (-12,12)"], correctAnswer: 2),
        //preguntas hipérbola
        QuestionQuiz(question: "Las coordenadas de los focos de la hipérbola son:", imageQ: UIImage.init(named: "quiz8"), options: ["(5,0) y (-5,0)", "(0,3) y (0,-3)", "(0,5) y (-5,0)", "(4,0) y (-4,0)"], correctAnswer: 0),
        QuestionQuiz(question: "Las coordenadas de los vértices de la hipérbola son:", imageQ: UIImage.init(named: "quiz8"), options: ["0,4) y (0,-4)", "(4,0) y (-4,0)", "(0,5) y (-5,0)", "(5,0) y (-5,0)"], correctAnswer: 1),
        QuestionQuiz(question: "Los ejes transverso y no transverso de la hipérbola son:", imageQ: UIImage.init(named: "quiz9"), options: ["10 y 6", "12 y 8", "10 y 8", "12 y 10"], correctAnswer: 2),
        QuestionQuiz(question: "Los ejes transverso y no transverso de la hipérbola son:", imageQ: UIImage.init(named: "quiz10"), options: ["-9 y 18","3 y 1","1 y 9","1 y 3"], correctAnswer: 1),
        QuestionQuiz(question: "Una hipérbola es equilátera si son iguales sus", imageQ: UIImage.init(named: "quiz11"), options: ["ejes", "focos", "vértices", "asíntotas"], correctAnswer: 0),
        QuestionQuiz(question: "¿Qué sección cónica está representada en la ecuación?", imageQ: UIImage.init(named: "quiz12"), options: ["círculo", "elipse", "parábola", "hipérbola"], correctAnswer: 3),
        QuestionQuiz(question: "Cuáles son los focos de la hipérbola", imageQ: UIImage.init(named: "quiz13"), options: ["(-4,4) y (-4,-2)","(4,4) y (4,-2)","(0,4) y (4,0)","(-2,4) y (2,-4)"], correctAnswer: 1),
        //preguntas parábola
        QuestionQuiz(question: "Encuentra el vértice y el foco de la parábola", imageQ: UIImage.init(named: "quiz14"), options: ["V(0), F(-2,0)","V(2,0), F(0,2)","V(0), F(2,0)","V(0), F(-2,0)"], correctAnswer: 0),
        QuestionQuiz(question: "Encuentra el vértice y el foco de la parábola", imageQ: UIImage.init(named: "quiz15"), options: ["V(2,2), F(3,-4)","V(2,4), F(2,-4)","V(-2,4), F(3,4)","V(-2,2), F(-2,4)"], correctAnswer: 2),
        QuestionQuiz(question: "Encuentra el vértice y el foco de la parábola", imageQ: UIImage.init(named: "quiz16"), options: ["V(-8,4), F(4,2)","V(8,3), F(4,3)","V(-8,-3), F(4,2)","V(-8,3), F(-4,-3)"], correctAnswer: 1),
        QuestionQuiz(question: "¿Cuál es el vértice de la parábola", imageQ: UIImage.init(named: "quiz17"), options: ["(3,2)","(2,-3)","(-3,-2)","(-2,-3)"], correctAnswer: 3)
    ]
    
    var questionIndex : [Int]!
    var actualQuestion = 0
    var counter = 0
    var show : [QuestionQuiz]!
    var correctAns = 0
    var calificacionFinal = 0
    var incorrectAns = 0
    
    
    @IBOutlet weak var viewImagen: UIView!
    @IBOutlet var viewQuiz: UIView!
     var colorFondo = UIColor(red: 239/255.0, green: 231/255.0, blue: 218/255.0, alpha: 1)
    
    var previousScale : CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnOptionA.backgroundColor = UIColor(red: 250/255.0, green: 121/255.0, blue: 33/255.0, alpha: 1)
        btnOptionB.backgroundColor = UIColor(red: 250/255.0, green: 121/255.0, blue: 33/255.0, alpha: 1)
        btnOptionC.backgroundColor = UIColor(red: 250/255.0, green: 121/255.0, blue: 33/255.0, alpha: 1)
        btnOptionD.backgroundColor = UIColor(red: 250/255.0, green: 121/255.0, blue: 33/255.0, alpha: 1)
        
        //self.viewQuiz.backgroundColor = colorFondo
    
        let gesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchAction(sender:)))
        self.viewQuiz.addGestureRecognizer(gesture)
        
        btnNextQuestion.isEnabled = false
        btnFinishQuiz.isEnabled = false
        btnFinishQuiz.isHidden = true
        
        questionIndex = Array(0 ..< listaPreguntas.count)
        show = listaPreguntas
        show.shuffle()
        update(questionIndex: 0)
        updateElements()
    }
    
    //actualiza la pregunta en el view
    func update(questionIndex : Int){
        
        btnOptionA.isEnabled = true
        btnOptionB.isEnabled = true
        btnOptionC.isEnabled = true
        btnOptionD.isEnabled = true
        //incrementa el contador de preguntas en 1
        counter += 1
        actualQuestion = questionIndex
        
        lbQuestion.text = show[questionIndex].question
        questionImage.image = show[questionIndex].imageQ
        
        btnOptionA.setTitle(show[questionIndex].options[0], for: .normal)
        btnOptionB.setTitle(show[questionIndex].options[1], for: .normal)
        btnOptionC.setTitle(show[questionIndex].options[2], for: .normal)
        btnOptionD.setTitle(show[questionIndex].options[3], for: .normal
        )
    }

    func updateElements(){
        //actualiza el contador de preguntas
        lbCounterQ.text = "\(actualQuestion + 1)/\(10)"
        //actualiza el estado del progress view
        progress.frame.size.width = (view.frame.size.width / CGFloat (10)) * CGFloat (counter)
    }
  
    
    @IBAction func selectedAnswer(_ sender: UIButton) {
        let btnIndex = opciones.index(of: sender)
        let object = show[questionIndex[actualQuestion]]
        if btnIndex == object.correctAnswer
        {opciones[btnIndex!].backgroundColor = UIColor.green
            btnOptionA.isEnabled = false
            btnOptionB.isEnabled = false
            btnOptionC.isEnabled = false
            btnOptionD.isEnabled = false
            btnNextQuestion.isEnabled = true
            correctAns += 10
            calificacionFinal = correctAns
        }
        else {
            opciones[btnIndex!].backgroundColor = UIColor.red
            btnOptionA.isEnabled = false
            btnOptionB.isEnabled = false
            btnOptionC.isEnabled = false
            btnOptionD.isEnabled = false
            btnNextQuestion.isEnabled = true
            incorrectAns += 1
            
        }
    }
    
    @IBAction func regresaMenu(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        if counter != show.count{
            update(questionIndex: actualQuestion + 1)
            updateElements()
        }
        
        for i in 0 ..< opciones.count{
            opciones[i].backgroundColor = UIColor.lightGray
        }
        
        //Si el contador de preguntas es igual a las preguntas que se mostraron en el quiz, deshabilita botón de siguiente y habilita botón de terminar
        if counter == 10{
            btnNextQuestion.isHidden = true
            btnFinishQuiz.isHidden = false
            btnFinishQuiz.isEnabled = true
        }
    }
    
    //el botón se activa para que el usuario pueda ver sus resultados
    @IBAction func btnFinish(_ sender: UIButton) {
        /*
        let alertaFinal = UIAlertController(title: "Ya terminaste:)", message: "Fin del quiz. ¿Quieres ver cómo te fue?", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertaFinal.addAction(restartAction)
    present(alertaFinal, animated: true, completion: nil)
    */
        alert(title: "Terminaste", message: "¿Quieres ver tus resultados?", completion: { result in
            if result {
                self.performSegue(withIdentifier: "Segue", sender: self)
            }
        })
    }
    
    
    func alert (title: String, message: String, completion: @escaping ((Bool) -> Void)) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "Sí", style: .default, handler: { (action) in
            alertController.dismiss(animated: true, completion: nil)
            completion(true)
            print("dijo que si")
        }))
        
        alertController.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { (action) in
            alertController.dismiss(animated: true, completion: nil)
            completion(false)
            self.dismiss(animated: true, completion: nil)
            print("dijo que no")
            
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func pinchAction(sender:UIPinchGestureRecognizer){
        let scale:CGFloat = previousScale * sender.scale
        self.viewImagen.transform = CGAffineTransform(scaleX: scale, y: scale);
        
        previousScale = sender.scale
        //CGAffineTransform(translationX: scale, y: scale)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Segue"){
            let vistaResultados = segue.destination as! ResultadosQuizViewController
            vistaResultados.resultado = String(calificacionFinal)
            
            if (calificacionFinal>=80){
                vistaResultados.comentario = "Felicidades! Eres un experto en secciones cónicas"
            }
            
            else if (calificacionFinal < 80){
                vistaResultados.comentario = "Sigue practicando :("
            }
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
}
