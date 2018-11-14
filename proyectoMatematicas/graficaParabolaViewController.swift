//
//  graficaParabolaViewController.swift
//  proyectoMatematicas
//
//  Created by Flor Barbosa on 10/24/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import UIKit
import Charts

class graficaParabolaViewController: UIViewController, ChartViewDelegate{

    
    @IBOutlet weak var chartView: LineChartView!
    
    @IBOutlet weak var tfX: UITextField!
    @IBOutlet weak var movY: UITextField!
    
    var vX : Double!
    var transY : Double!
    
    
    @IBOutlet var viewParabola: UIView!
    
    var colorFondo = UIColor(red: 255/255.0, green: 223/255.0, blue: 104/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.delegate = self
        
        self.viewParabola.backgroundColor = colorFondo
        
        vX = 1
        transY = 1
        chartView.chartDescription?.enabled = false
        
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        chartView.highlightPerDragEnabled = true
        chartView.backgroundColor = .white
        
        chartView.legend.enabled = false
        // chartView.xAxis.gridLineDashLengths = [1, 1]
        let xAxis = chartView.xAxis
        //xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        //xAxis.labelTextColor = UIColor(red: 255/255, green: 192/255, blue: 56/255, alpha: 1)
        xAxis.labelTextColor = UIColor.black
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = true
        xAxis.gridLineWidth = 1
        xAxis.gridLineDashLengths = [1,1]
        xAxis.axisMaximum = 100
        xAxis.axisMinimum = -100
        //xAxis.centerAxisLabelsEnabled = true
        //xAxis.granularity = 3600
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
        //leftAxis.yOffset = -9
        leftAxis.labelTextColor = UIColor.black
        
   
        chartView.xAxis.gridLineDashLengths = [1,1]
        chartView.rightAxis.enabled = false
        
        chartView.legend.form = .line
        
        setDataCount()
        chartView.animate(xAxisDuration: 2.5)
    }
    

    
    @IBAction func bGrafica(_ sender: UIButton) {
        vX = Double(tfX.text!)
        transY = Double(movY.text!)
        setDataCount()
        chartView.animate(xAxisDuration: 2.5)
    }
    
    
    
    func setDataCount(){
        let yVal = (-100..<100).map {
             return ChartDataEntry(x: Double($0), y: vX * pow(Double($0),2) + transY)
        }
        
        let set = LineChartDataSet(values: yVal, label: "Parabola")
        set.setColor(UIColor.red)
        //set.drawFilledEnabled = true
        set.drawCirclesEnabled = false
        set.lineWidth = 4
        
        // importantisima línea para que la grafica salva curveada tipo spline
        set.mode = .cubicBezier
        let data = LineChartData(dataSet: set)
        data.setValueFont(.systemFont(ofSize: 10, weight: .light))
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
    
    /*  @IBAction func quitaTeclado(_ sender: Any) {
     view.endEditing(true)
     }*/

    
    @IBAction func quitaTeclado(_ sender: Any) {
        view.endEditing(true)
    }
}
