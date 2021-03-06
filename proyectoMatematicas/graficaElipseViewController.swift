//
//  graficaElipseViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/30/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit
import Charts

class graficaElipseViewController: UIViewController, ChartViewDelegate {


    
    @IBOutlet weak var lbss1: UILabel!
    @IBOutlet weak var lbss2: UILabel!
    
    
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfB: UITextField!
    
    @IBOutlet weak var chartView: LineChartView!
    
    
    @IBOutlet var viewElipse: UIView!
    var colorFondo = UIColor(red: 255/255.0, green: 223/255.0, blue: 104/255.0, alpha: 1)
    
    var h : Double!
    var k : Double!
    var a : Double!
    var b : Double!
    var rangoMayor : Double!
    var rangoMenor : Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        var ss1 = "){2} + (y-"
        var fss1 : NSMutableAttributedString = ss1.customText()
        lbss1.attributedText = fss1
        
        var ss2 = "){2} = 1"
        var fss2 : NSMutableAttributedString = ss2.customText()
        lbss2.attributedText = fss2

        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false
        chartView.noDataText = "¡Grafica una elipse!"
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
        
        //xAxis.granularity = 0.5
        let leftAxis = chartView.leftAxis
        leftAxis.labelPosition = .insideChart
        leftAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        leftAxis.drawGridLinesEnabled = true
        leftAxis.gridLineWidth = 1
        leftAxis.gridLineDashLengths = [1,1]
        //leftAxis.granularityEnabled = true
        leftAxis.axisMinimum = -50
        leftAxis.axisMaximum = 50
        //leftAxis.granularity = 0.5
        leftAxis.yOffset = -9
        leftAxis.labelTextColor = UIColor.black
        
        chartView.xAxis.gridLineDashLengths = [1,1]
        chartView.rightAxis.enabled = false
        
        chartView.legend.form = .line
     
    }
    
    func setDataCount(){
        
            rangoMayor = sqrt(a) + h
            rangoMenor = h - sqrt(a)
        
        let kparay = k * -1
        
        
    
        rangoMayor = Double(String(format: "%.2f", rangoMayor))
    
        rangoMenor = Double(String(format: "%.2f", rangoMenor))
 
    
       var rango = stride(from: rangoMenor, through: rangoMayor, by: 0.01)
        
 
        let yVal1 = rango.map {(valor: Double) -> ChartDataEntry in
            return ChartDataEntry(x: Double(valor), y: k + sqrt( b * (1 - ( pow(Double(valor) - h , 2) / a))))
        }
        
        let yVal2 = (rango).map {(valor: Double) -> ChartDataEntry in
            return ChartDataEntry(x: Double(valor), y: (kparay + sqrt( b * (1 - ( pow(Double(valor) - h , 2) / a) ))) * -1)
        }
        
        let set1 = LineChartDataSet(values: yVal1, label: "Top")
        
        set1.setColor(UIColor.black)
        set1.drawCirclesEnabled = false
        set1.lineWidth = 4
        set1.mode = .cubicBezier
        
        let set2 = LineChartDataSet(values: yVal2, label: "Bottom")
        set2.setColor(UIColor.black)
        set2.drawCirclesEnabled = false
        set2.lineWidth = 4
        set2.mode = .cubicBezier
        
        let data = LineChartData(dataSets: [set1,set2])
        
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

    
    
    @IBAction func bGrafica(_ sender: UIButton) {

        
        if let hT = Double(tfH.text!), let kT = Double(tfK.text!), let aT = Double(tfA.text!), let bT = Double(tfB.text!){
            h = hT
            k = kT
            a = aT
            b = bT
            
            if a < 9 || b < 9 {
                let alerta = UIAlertController(title: "Error", message: "Valor de a o b no aceptable", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alerta.addAction(accion)
                present(alerta, animated: true, completion: nil)
            } 
            else{
            if h >= 50 || k >= 50 {
                let alerta = UIAlertController(title: "Error", message: "Los valores de h o k se salen del rango (-50 - 50)", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alerta.addAction(accion)
                present(alerta, animated: true, completion: nil)
            }
            else{
                setDataCount()
            }
            }
        }
        else{
            let alerta = UIAlertController(title: "Error", message: "Los campos deben tener valor numérico", preferredStyle: .alert)
            
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func quitaTeclado(_ sender: Any) {
        view.endEditing(true)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
}
