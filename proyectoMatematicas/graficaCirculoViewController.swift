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

    
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var lbEcuacion: UILabel!
    @IBOutlet weak var tfRadio: UITextField!
    @IBOutlet weak var svHK: UIStackView!
    @IBOutlet weak var sv00: UIStackView!
    @IBOutlet weak var segconOut: UISegmentedControl!
    
    var h : Double!
    var k : Double!
    var radio : Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        h = 0
        k = 0
        svHK.isHidden = true
        radio = 100
        
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
        
    
        setDataCount()
        chartView.animate(xAxisDuration: 2.5)
        
    }


    
    @IBAction func quitaTeclado(_ sender: Any) {
        view.endEditing(true)
    }
    
    func setDataCount() {
        
        // se definen los rangos en x que tendrá y no recibir valores NaN
        let rangoMayor = Int(sqrt(radio) + h)
        let rangoMenor = Int((sqrt(radio) - h) * -1)
        var rango = [Int]()
        
        for i in rangoMenor...rangoMayor{
            rango.append(i)
        }

        // parte de arriba del circulo
        let yVal1 = (rango).map { (valor : Int) -> ChartDataEntry in
            return ChartDataEntry(x: Double(valor), y: k + sqrt(radio - pow(Double(valor) - h, 2.0)))
        }
   
        // parte de abajo del circulo
        let yVal2 = (rango).map {
            (valor : Int) -> ChartDataEntry in
            //return ChartDataEntry(x: Double(valor), y: sqrt(radio - pow(Double(valor), 2.0)) * -1)
            return ChartDataEntry(x: Double(valor), y: k + sqrt(radio - pow(Double(valor) - h, 2.0)) * -1)
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
    
    @IBAction func scOrigen(_ sender: UISegmentedControl) {
        
        radio = Double(tfRadio.text!)
        
        if segconOut.selectedSegmentIndex == 0 {
            //230
            svHK.isHidden = true
            sv00.isHidden = false
            UIView.animate(withDuration: 1, animations: {
                self.tfRadio.frame.origin.x = 230
            })
            h = 0
            k = 0
        }
        else{
            
            svHK.isHidden = false
            sv00.isHidden = true
            //285
            UIView.animate(withDuration: 1, animations: {
                self.tfRadio.frame.origin.x = 285
            })
            h = Double(tfH.text!)
            k = Double(tfK.text!)
            
        }
    }
    
    @IBAction func bGrafica(_ sender: UIButton) {
       
        radio = Double(tfRadio.text!)
        
        if segconOut.selectedSegmentIndex == 0 {
            //230
            svHK.isHidden = true
            sv00.isHidden = false
            UIView.animate(withDuration: 1, animations: {
                self.tfRadio.frame.origin.x = 230
            })
            h = 0
            k = 0
        }
        else{
            
            svHK.isHidden = false
            sv00.isHidden = true
            //285
            UIView.animate(withDuration: 1, animations: {
                self.tfRadio.frame.origin.x = 285
            })
            h = Double(tfH.text!)
            k = Double(tfK.text!)
            
        }
        
        setDataCount()
        chartView.animate(xAxisDuration: 2.5)
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
