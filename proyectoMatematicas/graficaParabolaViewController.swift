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
    
    @IBOutlet weak var lbx2: UILabel!
    
    @IBOutlet weak var chartView: LineChartView!
    
    @IBOutlet weak var tfX: UITextField!
    @IBOutlet weak var movY: UITextField!
    
    var vX : Double!
    var transY : Double!
    
    
    @IBOutlet var viewParabola: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let superScript = "x{2} +"
        let fsuperScript : NSMutableAttributedString = superScript.customText()
        
        lbx2.attributedText = fsuperScript
        chartView.delegate = self
        

        vX = 1
        transY = 1
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
        leftAxis.labelTextColor = UIColor.black
        
   
        chartView.xAxis.gridLineDashLengths = [1,1]
        chartView.rightAxis.enabled = false
        
        chartView.legend.form = .line

    }
    

    
    @IBAction func bGrafica(_ sender: UIButton) {
  
        
        if let xT = Double(tfX.text!) , let yT = Double(movY.text!) {
            vX = xT
            transY = yT
            
            
            
            if transY >= 50 {
                let alerta = UIAlertController(title: "Error", message: "Los valores de h o k se salen del rango (-50 - 50)", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alerta.addAction(accion)
                present(alerta, animated: true, completion: nil)
            }
            else{
                setDataCount()
                chartView.animate(xAxisDuration: 2.5)
            }
            
        }
        else{
            let alerta = UIAlertController(title: "Error", message: "Los campos deben tener valor numérico", preferredStyle: .alert)
            
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
        }
    }
    
    
    
    func setDataCount(){
        let yVal = (-100..<100).map {
             return ChartDataEntry(x: Double($0), y: vX * pow(Double($0),2) + transY)
        }
        
        let set = LineChartDataSet(values: yVal, label: "Parabola")
        set.setColor(UIColor.black)
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
    


    
    @IBAction func quitaTeclado(_ sender: Any) {
        view.endEditing(true)
    }
}
