//
//  graficaCirculoViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/24/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit
import Charts

class graficaCirculoViewController: UIViewController, ChartViewDelegate {

    
  
    
    @IBOutlet weak var chartView: LineChartView!
    

    var vX : Double!
    var vY : Double!
    var vR : Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chartView.delegate = self

        vX = 1
        vY = 1
        vR = 100
    
        
        chartView.chartDescription?.enabled = false
        
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        chartView.highlightPerDragEnabled = true
        
        chartView.backgroundColor = .white
    
        chartView.legend.enabled = false

        
        let xAxis = chartView.xAxis
        //xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        xAxis.labelTextColor = UIColor.black
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = true
        xAxis.gridLineWidth = 1
        xAxis.gridLineDashLengths = [1,1]
        xAxis.axisMaximum = 200
        xAxis.axisMinimum = -200
        
        xAxis.granularity = 0.5
        let leftAxis = chartView.leftAxis
        leftAxis.labelPosition = .insideChart
        leftAxis.labelFont = .systemFont(ofSize: 12, weight: .light)
        leftAxis.drawGridLinesEnabled = true
        leftAxis.gridLineWidth = 1
        leftAxis.gridLineDashLengths = [1,1]
        leftAxis.granularityEnabled = true
        leftAxis.axisMinimum = -200
        leftAxis.axisMaximum = 200
        leftAxis.granularity = 0.5
        leftAxis.yOffset = -9
        leftAxis.labelTextColor = UIColor.black
        
        chartView.xAxis.gridLineDashLengths = [1,1]
        chartView.rightAxis.enabled = false
        
        chartView.legend.form = .line
        
    
        setDataCount()
        //chartView.animate(xAxisDuration: 2.5)
        
        // Do any additional setup after loading the view.
    }
    
  

    
    @IBAction func quitaTeclado(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func bGrafica(_ sender: UIButton){
        // número que se pasa de parámetro es el rango en X
        vR = 100
        setDataCount()
        chartView.animate(xAxisDuration: 2.5)
    }
    
    
    func setDataCount() {
        
        let yVal1 = (-200...200).map {
            //return ChartDataEntry(x: Double($0), y: sqrt(vR - pow(Double($0) - vX, 2)))
            //return ChartDataEntry(x: Double($0), y: Double(sqrt(100 - pow(Double($0), 2))))
            return ChartDataEntry(x: Double($0)/10, y: sqrt(vR - pow(Double($0)/10, 2)))
            //return ChartDataEntry(x: Double($0)/10, y: pow(Double($0),2))
           
        }
        
        let yVal2 = (-50...50).map {
            //return ChartDataEntry(x: Double($0)/10, y: sqrt((vR - (vX * pow(Double($0)/10, 2))) / vY) * -1)
           return ChartDataEntry(x: Double($0)/10, y: sqrt(vR - pow(Double($0)/10, 2)))
        }
        
        let set1 = LineChartDataSet(values: yVal1, label: "Arriba")
         //set1.axisDependency = .left
         set1.setColor(UIColor.red)
         set1.drawCirclesEnabled = false
         set1.lineWidth = 2
        set1.mode = .cubicBezier
        
        let set2 = LineChartDataSet(values: yVal2, label: "Abajo")
        set2.setColor(UIColor.black)
        set2.drawCirclesEnabled = false
        set2.lineWidth = 2
        set2.mode = .cubicBezier

        let data = LineChartData(dataSets: [set1,set2])
        //let data = LineChartData(dataSet: set1)
        
        //data.setValueTextColor(.white)
        data.setValueFont(.systemFont(ofSize: 9))
        data.setDrawValues(false)
        chartView.data = data
    }
    
    // TO DO: checar que el valor ingresado sea válido / numérico
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
