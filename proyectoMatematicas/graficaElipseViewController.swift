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
        
        self.viewElipse.backgroundColor = colorFondo
        
        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false
        
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        chartView.highlightPerDragEnabled = true
        
        chartView.backgroundColor = .white
        
        chartView.legend.enabled = false
        
        
        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        xAxis.labelTextColor = UIColor.black
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = true
        xAxis.gridLineWidth = 1
        xAxis.gridLineDashLengths = [1,1]
        xAxis.axisMaximum = 50
        xAxis.axisMinimum = -50
        
        xAxis.granularity = 0.5
        let leftAxis = chartView.leftAxis
        leftAxis.labelPosition = .insideChart
        leftAxis.labelFont = .systemFont(ofSize: 12, weight: .light)
        leftAxis.drawGridLinesEnabled = true
        leftAxis.gridLineWidth = 1
        leftAxis.gridLineDashLengths = [1,1]
        leftAxis.granularityEnabled = true
        leftAxis.axisMinimum = -50
        leftAxis.axisMaximum = 50
        leftAxis.granularity = 0.5
        leftAxis.yOffset = -9
        leftAxis.labelTextColor = UIColor.black
        
        chartView.xAxis.gridLineDashLengths = [1,1]
        chartView.rightAxis.enabled = false
        
        chartView.legend.form = .line
        
        
        //setDataCount()
        //chartView.animate(xAxisDuration: 2.5)
    }
    
    func setDataCount(){
        
            rangoMayor = sqrt(a) + h
            rangoMenor = h - sqrt(a)
        
        let kparay = k * -1
        
        
    
        rangoMayor = Double(String(format: "%.2f", rangoMayor))
    
        rangoMenor = Double(String(format: "%.2f", rangoMenor))
        print(rangoMenor, rangoMayor)
        /*for radians in stride(from: 0.0, through: .pi * 2, by: .pi / 2) {
         let degrees = Int(radians * 180 / .pi)
         */
        /*var rango = [Double]()
        for num in stride(from: rangoMenor, through: rangoMayor, by: 0.01){
            rango.append(num)
        }*/
        
    
       var rango = stride(from: rangoMenor, through: rangoMayor, by: 0.01)
        
        /*if rango.last != rangoMayor {
            rango.append(rangoMayor)
        }*/
    
    
        /*rango.forEach { (num) in
            print(num)
        }*/
        let yVal1 = rango.map {(valor: Double) -> ChartDataEntry in
            return ChartDataEntry(x: Double(valor), y: k + sqrt( b * (1 - ( pow(Double(valor) - h , 2) / a))))
        }
        
        print(yVal1)
        
        let yVal2 = (rango).map {(valor: Double) -> ChartDataEntry in
            return ChartDataEntry(x: Double(valor), y: (kparay + sqrt( b * (1 - ( pow(Double(valor) - h , 2) / a) ))) * -1)
        }
        
        let set1 = LineChartDataSet(values: yVal1, label: "Top")
        //set1.axisDependency = .left
        set1.setColor(UIColor.red)
        set1.drawCirclesEnabled = false
        set1.lineWidth = 2
        set1.mode = .cubicBezier
        
        let set2 = LineChartDataSet(values: yVal2, label: "Bottom")
        set2.setColor(UIColor.black)
        set2.drawCirclesEnabled = false
        set2.lineWidth = 2
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
       
        h = Double(tfH.text!)
        k = Double(tfK.text!)
        a = Double(tfA.text!)
        b = Double(tfB.text!)
        
        setDataCount()
    }
    
    
    @IBAction func quitaTeclado(_ sender: Any) {
        view.endEditing(true)
    }
}
