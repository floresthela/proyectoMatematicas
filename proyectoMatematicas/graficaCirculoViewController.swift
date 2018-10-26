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

    
    @IBOutlet weak var tfX: UITextField!
    @IBOutlet weak var tfY: UITextField!
    @IBOutlet weak var tfR: UITextField!
    
    @IBOutlet weak var chartView: LineChartView!
    
    @IBOutlet weak var sv1: UIStackView!
    @IBOutlet weak var sv0: UIStackView!
    
    var vX : Double!
    var vY : Double!
    var vR : Double!
    var points = [Double]()
    
    @IBOutlet weak var segCon: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.delegate = self
        sv1.isHidden = true

        vX = 1
        vY = 1
        
        if segCon.selectedSegmentIndex == 0{
            vX = 1
            vY = 1
        }
        else{
            //vX = Double(tfX.text!)
            //vY = Double(tfY.text!)
        }
        
        chartView.backgroundColor = .white
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true

        // x-axis limit line
        let llXAxis = ChartLimitLine(limit: 5, label: "Index 10")
        llXAxis.lineWidth = 10
        llXAxis.lineDashLengths = [10, 10, 0]
        llXAxis.labelPosition = .rightBottom
        llXAxis.valueFont = .systemFont(ofSize: 10)
        
        chartView.xAxis.gridLineDashLengths = [1, 1]
        //chartView.xAxis.gridLineDashPhase = 0
        
        chartView.leftAxis.axisMinimum = -20
        chartView.leftAxis.axisMaximum = 20
        chartView.rightAxis.axisMinimum = -20
        chartView.rightAxis.axisMaximum = 20
        chartView.xAxis.axisMinimum = -20
        chartView.xAxis.axisMaximum = 20
        
        vR = 100
        setDataCount(100)
        chartView.animate(xAxisDuration: 2.5)
        // Do any additional setup after loading the view.
    }
    
  

    
    @IBAction func quitaTeclado(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func scOrigen(_ sender: UISegmentedControl) {
        switch segCon.selectedSegmentIndex
        {
        case 0:
            sv0.isHidden = false
            sv1.isHidden = true
            UIView.animate(withDuration: 1, animations:{
                self.tfR.frame.origin.x = 237
            })
            tfR.text = ""
            vX = 1
            vY = 1
        case 1:
            sv1.isHidden = false
            sv0.isHidden = true
            UIView.animate(withDuration: 1, animations:{
                self.tfR.frame.origin.x = 291
            })
            tfR.text = ""
        default:
            break
        }
    }
    
    @IBAction func bGrafica(_ sender: UIButton){
        // número que se pasa de parámetro es el rango en X
         vR = Double(tfR.text!)
        vR = 100
        setDataCount(100)
    }
    
    
    func setDataCount(_ count: Int) {
        
        let yVal1 = (-20..<count).map {
            return ChartDataEntry(x: Double($0), y: sqrt(vR - pow(Double($0) - vX, 2)))
        }
        
        let yVal2 = (-20..<count).map {
            return ChartDataEntry(x: Double($0), y: sqrt(vR - pow(Double($0) - vX, 2)) * -1)
        }
        let set1 = LineChartDataSet(values: yVal1, label: "DataSet 1")
         set1.axisDependency = .left
         set1.setColor(UIColor(red: 255/255, green: 241/255, blue: 46/255, alpha: 1))
         set1.drawCirclesEnabled = false
         set1.lineWidth = 2
         set1.circleRadius = 3
         set1.fillAlpha = 1
         set1.drawFilledEnabled = true
         set1.fillColor = .white
         set1.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
         set1.drawCircleHoleEnabled = false

        let set2 = LineChartDataSet(values: yVal2, label: "x")
        set2.axisDependency = .left
        set2.setColor(UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1))
        set1.drawCirclesEnabled = true
        set2.lineWidth = 2
        set2.circleRadius = 3
        set2.fillAlpha = 1
        set1.drawFilledEnabled = false
        
        set2.fillColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
        set2.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set2.drawCircleHoleEnabled = false
        
        let data = LineChartData(dataSets: [set1,set2])
        data.setDrawValues(false)
        data.setValueTextColor(.white)
        data.setValueFont(.systemFont(ofSize: 9))
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
