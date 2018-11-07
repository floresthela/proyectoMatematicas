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

    
    @IBOutlet weak var chartView: LineChartView!
    
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    
    @IBOutlet weak var tfA: UITextField!
    
    @IBOutlet weak var tfB: UITextField!
    
    
    var h : Double!
    var k : Double!
    var a : Double!
    var b : Double!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        xAxis.granularity = 1
        let leftAxis = chartView.leftAxis
        leftAxis.labelPosition = .insideChart
        leftAxis.labelFont = .systemFont(ofSize: 12, weight: .light)
        leftAxis.drawGridLinesEnabled = true
        leftAxis.gridLineWidth = 1
        leftAxis.gridLineDashLengths = [1,1]
        leftAxis.granularityEnabled = true
        leftAxis.axisMinimum = -50
        leftAxis.axisMaximum = 50
        leftAxis.granularity = 1
        leftAxis.yOffset = -9
        leftAxis.labelTextColor = UIColor.black
        
        chartView.xAxis.gridLineDashLengths = [1,1]
        chartView.rightAxis.enabled = false
        
        chartView.legend.form = .line
        
        
        //setDataCount()
        //chartView.animate(xAxisDuration: 2.5)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bGrafica(_ sender: UIButton) {
        
        h = Double(tfH.text!)
        k = Double(tfK.text!)
        a = Double(tfA.text!)
        b = Double(tfB.text!)
        
        setDataCount()
        //chartView.animate(xAxisDuration: 2.5)
    }
    
    func setDataCount(){
        
        
        let rango11 = -50.0
        let rango12 = ( h - sqrt(a))
        print(rango11, rango12)
        
        let rango21 = (sqrt(a) + h)
        let rango22  = 50.0
        print(rango21, rango22)
        
        let rango1 = stride(from: rango11, through: rango12, by: 0.5)
        
        let rango2 = stride(from: rango21, through: rango22, by: 0.5)
        
        
        let yVal1 = (rango1).map {(valor: Double) -> ChartDataEntry in
            
            return ChartDataEntry(x: Double(valor), y: k + sqrt( b * (( pow(Double(valor) - h , 2) / a) - 1 )))
        }
        
       
        let yVal2 = (rango2).map {(valor: Double) -> ChartDataEntry in
            return ChartDataEntry(x: Double(valor), y: k + sqrt( b * (( pow(Double(valor) - h , 2) / a) - 1 )) * -1)
        }
        
        let yVal3 = (rango2).map {(valor: Double) -> ChartDataEntry in
            
            return ChartDataEntry(x: Double(valor), y: k + sqrt( b * (( pow(Double(valor) - h , 2) / a) - 1 )))
        }
        
        let yVal4 = (rango1).map {(valor: Double) -> ChartDataEntry in
            return ChartDataEntry(x: Double(valor), y: k + sqrt( b * (( pow(Double(valor) - h , 2) / a) - 1 )) * -1)
        }
        print("VALORES MALOS", yVal1)
        print("BUENOS VALORES", yVal2)
        let set1 = LineChartDataSet(values: yVal1, label: "1")
        set1.setColor(UIColor.green)
        set1.drawCirclesEnabled = false
        set1.lineWidth = 2
        set1.mode = .cubicBezier
        
        let set2 = LineChartDataSet(values: yVal2, label: "2")
        set2.setColor(UIColor.red)
        set2.drawCirclesEnabled = false
        set2.lineWidth = 2
        set2.mode = .cubicBezier
        
        let set3 = LineChartDataSet(values: yVal3, label: "2")
        set3.setColor(UIColor.blue)
        set3.drawCirclesEnabled = false
        set3.lineWidth = 2
        set3.mode = .cubicBezier
        
        let set4 = LineChartDataSet(values: yVal4, label: "2")
        set4.setColor(UIColor.black)
        set4.drawCirclesEnabled = false
        set4.lineWidth = 2
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

}
