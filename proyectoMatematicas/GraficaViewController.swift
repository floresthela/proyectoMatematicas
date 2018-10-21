//
//  GraficaViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/20/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit
import Charts

class GraficaViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var chartView: LineChartView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.delegate = self
        
        
        // número que se pasa de parámetro es el rango en X
        setDataCount(100)
        
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        
        // x-axis limit line
        let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
        llXAxis.lineWidth = 10
        llXAxis.lineDashLengths = [10, 10, 0]
        llXAxis.labelPosition = .rightBottom
        llXAxis.valueFont = .systemFont(ofSize: 10)
        
        chartView.xAxis.gridLineDashLengths = [5, 5]
        chartView.xAxis.gridLineDashPhase = 0
        
    
        chartView.leftAxis.axisMinimum = -20
        chartView.leftAxis.axisMaximum = 20
        chartView.rightAxis.axisMinimum = -20
        chartView.rightAxis.axisMaximum = 20
        chartView.xAxis.axisMinimum = -20
        chartView.xAxis.axisMaximum = 20
        
        
        chartView.animate(xAxisDuration: 2.5)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func regresaMenu(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    
    func setDataCount(_ count: Int) {
        let yVal1 = (-10..<count).map {
            //return ChartDataEntry(x: Double($0), y: sin(.pi))
            return ChartDataEntry(x: Double($0), y: sqrt(81 - pow(Double($0), 2)))
        }
        
        
        let yVal2 = (-10..<count).map {
            //let xAxis = Double($0)
            //let yAxis = sqrt(16 - pow(xAxis, 2))
            return ChartDataEntry(x: Double($0), y: pow(Double($0),2))
        }
        
        let yVal3 = (-10..<count).map {
             return ChartDataEntry(x: Double($0), y: sqrt(81 - pow(Double($0), 2)) * -1)
        }
        
        let set1 = LineChartDataSet(values: yVal1, label: "DataSet 1")
    
        set1.axisDependency = .left
        set1.setColor(UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1))
        set1.setCircleColor(.white)
        set1.lineWidth = 2
        set1.circleRadius = 3
        set1.fillAlpha = 65/255
        set1.fillColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
        set1.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set1.drawCircleHoleEnabled = false
       
        let set2 = LineChartDataSet(values: yVal2, label: "x")
        
        set2.axisDependency = .left
        set2.setColor(UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1))
        set2.setCircleColor(.blue)
        set2.lineWidth = 2
        set2.circleRadius = 3
        set2.fillAlpha = 65/255
        set2.fillColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
        set2.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set2.drawCircleHoleEnabled = false
        
        let set3 = LineChartDataSet(values: yVal3, label: "otro")
        
        set3.axisDependency = .left
        set3.setColor(UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1))
        set3.setCircleColor(.blue)
        set3.lineWidth = 2
        set3.circleRadius = 3
        set3.fillAlpha = 65/255
        set3.fillColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
        set3.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set3.drawCircleHoleEnabled = false
        
        
        let data = LineChartData(dataSets: [set1,set2,set3])
        data.setValueTextColor(.white)
        data.setValueFont(.systemFont(ofSize: 9))
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
