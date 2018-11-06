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

    @IBOutlet weak var chartView: LineChartView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chartView.delegate = self
        
        
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        chartView.highlightPerDragEnabled = true
        chartView.backgroundColor = .white
        
        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        xAxis.labelTextColor = UIColor.black
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = true
        xAxis.gridLineWidth = 1
        xAxis.gridLineDashLengths = [1,1]
        xAxis.axisMaximum = 100
        xAxis.axisMinimum = -100
        xAxis.granularity = 0.5
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelPosition = .insideChart
        leftAxis.labelFont = .systemFont(ofSize: 12, weight: .light)
        leftAxis.drawGridLinesEnabled = true
        leftAxis.gridLineWidth = 1
        leftAxis.gridLineDashLengths = [1,1]
        leftAxis.granularityEnabled = true
        leftAxis.axisMinimum = -100
        leftAxis.axisMaximum = 100
        leftAxis.granularity = 0.5
        leftAxis.labelTextColor = UIColor.black
        
        
        chartView.xAxis.gridLineDashLengths = [1,1]
        chartView.rightAxis.enabled = false
        
        chartView.legend.form = .line
        
        setDataCount()
        chartView.animate(xAxisDuration: 2.5)
    }
    
    func setDataCount(){
        let val1 = (-100..<100).map{
            //return ChartDataEntry(x: Double($0), y: sqrt((1-(pow(Double($0), 2)/100)) * 20))
            return ChartDataEntry(x: Double($0), y: sqrt(-pow(25,2) * (1 - (pow(Double($0),2)/25))))
        }
        let val2 = (-100..<100).map{
            //return ChartDataEntry(x: Double($0), y: sqrt((1-(pow(Double($0), 2)/100)) * 20) * -1)
            return ChartDataEntry(x: Double($0), y: sqrt(-pow(25,2) * (1 - (pow(Double($0),2)/25))) * -1)
        }
        
        let set = LineChartDataSet(values: val1, label: "Elipse")
        set.setCircleColor(UIColor.blue)
        set.drawFilledEnabled = false
        set.drawCirclesEnabled = false
        set.lineWidth = 4
        
        set.mode = .cubicBezier
        let data = LineChartData(dataSet: set)
    
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
