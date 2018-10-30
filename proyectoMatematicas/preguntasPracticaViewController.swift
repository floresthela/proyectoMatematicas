//
//  preguntasPracticaViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/29/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit
/*struct Question {
 let question: String
 let answers: [String]
 let correctAnswer: Int
 }*/
struct Pregunta {
    let pregunta: String
    let opciones: [String]
    let respCorrecta: Int
    let imagen: UIImage?
    let feedback: String
}


class preguntasPracticaViewController: UIViewController {

    
    //var questions: [Question] = [
    var preguntas: [Pregunta] = [
    Pregunta(pregunta: "¿Pregunta 1?", opciones: ["Parabola", "Hiperbola", "Elipse", "Círculo"], respCorrecta: 0, imagen: nil, feedback: "Recuerda que la parabola bla bla bla")
    ]
    
    var indicePregunta: [Int]!
    var indicePreguntaActual = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        /* questionIndexes = Array(0 ..< questions.count)  // builds an array [0, 1, 2, ... n]
         questionIndexes.shuffle()                       // randomizes that list
         
         updateLabelsAndButtonsForIndex(0)*/
        // Do any additional setup after loading the view.
        indicePregunta = Array(0 ..< preguntas.count)
        indicePregunta.shuffle()
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
