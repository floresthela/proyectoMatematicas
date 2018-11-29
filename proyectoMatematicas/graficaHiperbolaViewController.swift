//
//  graficaHiperbolaViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 11/6/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit
import Charts

class graficaHiperbolaViewController: UIViewController, ChartViewDelegate {

    
    @IBOutlet weak var lbss1: UILabel!
    @IBOutlet weak var lbss2: UILabel!
    
    @IBOutlet weak var segconXY: UISegmentedControl!
    
    @IBOutlet weak var lb1: UILabel!
    
    @IBOutlet weak var chartView: LineChartView!
    
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    
    @IBOutlet weak var tfA: UITextField!
    
    @IBOutlet weak var tfB: UITextField!
    
    @IBOutlet var viewHiperbola: UIView!
    
    var h : Double!
    var k : Double!
    var a : Double!
    var b : Double!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ss1 = "){2} - (y - "
        let fss1 : NSMutableAttributedString = ss1.customText()
        lbss1.attributedText = fss1
        
        let ss2 = "){2} = 1"
        let fss2 : NSMutableAttributedString = ss2.customText()
        lbss2.attributedText = fss2
        
        
        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false
        
        
        chartView.dragEnabled = false
        chartView.setScaleEnabled(false)
        chartView.pinchZoomEnabled = false
        chartView.highlightPerDragEnabled = true

        chartView.backgroundColor = .white
        
        chartView.legend.enabled = false
        
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .topInside
        xAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        xAxis.labelTextColor = UIColor.black
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = true
        xAxis.gridLineWidth = 1
        xAxis.gridLineDashLengths = [1,1]
        xAxis.axisMaximum = 50
        xAxis.axisMinimum = -50
        xAxis.granularityEnabled = false
    
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelPosition = .insideChart
        leftAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        leftAxis.drawGridLinesEnabled = true
        leftAxis.gridLineWidth = 1
        leftAxis.gridLineDashLengths = [1,1]
        leftAxis.granularityEnabled = false
        leftAxis.axisMinimum = -50
        leftAxis.axisMaximum = 50
        leftAxis.granularity = 1
        leftAxis.yOffset = -9
        leftAxis.labelTextColor = UIColor.black
        
        chartView.xAxis.gridLineDashLengths = [1,1]
        chartView.rightAxis.enabled = false

        
        chartView.legend.form = .line
        

    }
    
    
    
    @IBAction func xy(_ sender: UISegmentedControl) {
        if segconXY.selectedSegmentIndex == 0 {
            lb1.text = "(x -"
            lbss1.attributedText = "){2} - (y-".customText()
        
        }
        else{
            lb1.text = "(y -"
            lbss1.attributedText = "){2} - (x-".customText()
            
        }
    }
    
    
    
    @IBAction func bGrafica(_ sender: UIButton) {
        if let hT = Double(tfH.text!), let kT = Double(tfK.text!), let aT = Double(tfA.text!), let bT = Double(tfB.text!) {
            
            h = hT
            k = kT
            a = aT
            b = bT
            
            if raiz(a) == false || raiz(b) == false || a < 9 || b < 9 {
                let alerta = UIAlertController(title: "Error", message: "Valor de a o b no aceptable", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alerta.addAction(accion)
                present(alerta, animated: true, completion: nil)
            } // if raiz
        else{
            if h >= 50 || k >= 50 {
                let alerta = UIAlertController(title: "Error", message: "Los valores de h o k se salen del rango (-50 - 50)", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alerta.addAction(accion)
                present(alerta, animated: true, completion: nil)
            }
            else{
                // graficar
                setDataCount()
            }
        }
        } // if valor es numérico
        
        else{
            let alerta = UIAlertController(title: "Error", message: "Los campos deben tener valor numérico", preferredStyle: .alert)
            
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
        }
    
    } // bGrafica
    

    
    func setDataCount(){
        
        let rango11 = -50.0
        let rango12 = ( h - sqrt(a))
        
        let rango21 = (sqrt(a) + h)
        let rango22  = 50.0
       
        
        let rango1 = stride(from: rango11, through: rango12, by: 0.01)
        
        let rango2 = stride(from: rango21, through: rango22, by: 0.01)
    
        let rangoV = stride(from: -50.0, through: 50.0, by: 0.01)
        
        var yVal1 = [ChartDataEntry]()
        var yVal2 = [ChartDataEntry]()
        var yVal3 = [ChartDataEntry]()
        var yVal4 = [ChartDataEntry]()
        
        if segconXY.selectedSegmentIndex == 0 {
            yVal1 = (rango1).map {(valor: Double) -> ChartDataEntry in
                return ChartDataEntry(x: Double(valor), y: k + sqrt( b * (( pow(Double(valor) - h , 2) / a) - 1 )))
            }
            
            yVal2 = (rango2).map {(valor: Double) -> ChartDataEntry in
                return ChartDataEntry(x: Double(valor), y: k + sqrt( b * (( pow(Double(valor) - h , 2) / a) - 1 )) * -1)
            }
            
            yVal3 = (rango2).map {(valor: Double) -> ChartDataEntry in
                
                return ChartDataEntry(x: Double(valor), y: k + sqrt( b * (( pow(Double(valor) - h , 2) / a) - 1 )))
            }
            
            yVal4 = (rango1).map {(valor: Double) -> ChartDataEntry in
                return ChartDataEntry(x: Double(valor), y: k + sqrt( b * (( pow(Double(valor) - h , 2) / a) - 1 )) * -1)
            }
        }
        
        else{
            yVal1 = (rangoV).map {(valor: Double) -> ChartDataEntry in
                return ChartDataEntry(x: Double(valor), y: h + sqrt( a * (( pow(Double(valor) - k , 2) / b) + 1 )))
            }
            
            
            yVal2 = (rangoV).map {(valor: Double) -> ChartDataEntry in
                return ChartDataEntry(x: Double(valor), y: h + sqrt( a * (( pow(Double(valor) - k , 2) / b) + 1 )) * -1)
            }
            
            yVal3 = (rangoV).map {(valor: Double) -> ChartDataEntry in
                
                return ChartDataEntry(x: Double(valor), y: h + sqrt( a * (( pow(Double(valor) - k , 2) / b) + 1 )))
            }
            
            yVal4 = (rangoV).map {(valor: Double) -> ChartDataEntry in
                return ChartDataEntry(x: Double(valor), y: h + sqrt( a * (( pow(Double(valor) - k , 2) / b) + 1 )) * -1)
            }
        }
            
    
        let set1 = LineChartDataSet(values: yVal1, label: "1")
        set1.setColor(UIColor.black)
        set1.drawCirclesEnabled = false
        set1.lineWidth = 4
        set1.mode = .cubicBezier
        
        let set2 = LineChartDataSet(values: yVal2, label: "2")
        set2.setColor(UIColor.black)
        set2.drawCirclesEnabled = false
        set2.lineWidth = 4
        set2.mode = .cubicBezier
        
        let set3 = LineChartDataSet(values: yVal3, label: "2")
        set3.setColor(UIColor.black)
        set3.drawCirclesEnabled = false
        set3.lineWidth = 4
        set3.mode = .cubicBezier
        
        let set4 = LineChartDataSet(values: yVal4, label: "2")
        set4.setColor(UIColor.black)
        set4.drawCirclesEnabled = false
        set4.lineWidth = 4
        set4.mode = .cubicBezier
        
        
        let data = LineChartData(dataSets: [set1,set2,set3,set4])
        data.setValueFont(.systemFont(ofSize: 9))
        data.setDrawValues(false)
        chartView.data = data
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

    // función para esconder el teclado al dar tap en cualquier parte de la pantalla
    @IBAction func quitaTeclado(_ sender: Any) {
        view.endEditing(true)
    }
    
    // raíz perfecta
    func raiz(_ number: Double) -> Bool{
        let x = Int(sqrt(number))
        
        if(pow(Double(x), 2) == number){
            return true
        }
        else{
            return false
        }

    }
}
