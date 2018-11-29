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
   
    @IBOutlet weak var tfRadio: UITextField!
    @IBOutlet weak var svHK: UIStackView!
    @IBOutlet weak var sv00: UIStackView!
    @IBOutlet weak var segconOut: UISegmentedControl!
    
    
    @IBOutlet weak var btnGrafica: UIButton!
    @IBOutlet var viewGraficar: UIView!
    
    var h : Double!
    var k : Double!
    var radio : Double!
    
    //x2
    @IBOutlet weak var ssx: UILabel!
    
    //y2 =
    @IBOutlet weak var ssy: UILabel!
    
    //)2 + (y -
    @IBOutlet weak var ss1: UILabel!
    
    //)2 =
    @IBOutlet weak var ss2: UILabel!
    
    
    
     var colorFondo = UIColor(red: 255/255.0, green: 223/255.0, blue: 104/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ssx.attributedText = "x{2} + ".customText()
        ssy.attributedText = "y{2} =".customText()
        ss1.attributedText = "){2} + (y - ".customText()
        ss2.attributedText = "){2}=".customText()
        
        
        UIView.animate(withDuration: 1, animations: {
            self.tfRadio.frame.origin.x = 180
        })
        
        h = 0
        k = 0
        svHK.isHidden = true
        radio = 100
        
        chartView.delegate = self

        chartView.chartDescription?.enabled = false
        
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
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
        
        xAxis.granularity = 0.5
        let leftAxis = chartView.leftAxis
        leftAxis.labelPosition = .insideChart
        leftAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
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
        
        
    }


    
    @IBAction func quitaTeclado(_ sender: Any) {
        view.endEditing(true)
    }
    
    func setDataCount() {
        
        // se definen los rangos en x que tendrá y no recibir valores NaN

        let rangoMayor = sqrt(radio) + h
        let rangoMenor = (h - sqrt(radio))
        let rango = stride(from: rangoMenor, through: rangoMayor, by: 0.01)

        // parte de arriba del circulo
        let yVal1 = (rango).map { (valor : Double) -> ChartDataEntry in
            return ChartDataEntry(x: Double(valor), y: k + sqrt(radio - pow(Double(valor) - h, 2.0)))
        }
   
        // parte de abajo del circulo
        let yVal2 = (rango).map {
            (valor : Double) -> ChartDataEntry in
            return ChartDataEntry(x: Double(valor), y: k + sqrt(radio - pow(Double(valor) - h, 2.0)) * -1)
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
    
    @IBAction func scOrigen(_ sender: UISegmentedControl) {
        
        radio = Double(tfRadio.text!)
        
        if segconOut.selectedSegmentIndex == 0 {
            svHK.isHidden = true
            sv00.isHidden = false
            UIView.animate(withDuration: 1, animations: {
                self.tfRadio.frame.origin.x = 180
            })
            h = 0
            k = 0

        }
        else{
            
            svHK.isHidden = false
            sv00.isHidden = true
            //285
            UIView.animate(withDuration: 1, animations: {
                self.tfRadio.frame.origin.x = 252
            })
            h = Double(tfH.text!)
            k = Double(tfK.text!)
            
        }
    }
    
    @IBAction func bGrafica(_ sender: UIButton) {
       
        
        // valores numericos
        if let radioT = Double(tfRadio.text!), let  _ = Double(tfH.text!) , let _ = Double(tfK.text!) {
            
            radio = radioT
           
            if segconOut.selectedSegmentIndex == 0 {
                svHK.isHidden = true
                sv00.isHidden = false

                h = 0
                k = 0
            }
            else{
                
                svHK.isHidden = false
                sv00.isHidden = true
                h = Double(tfH.text!)
                k = Double(tfK.text!)
                
            }
            
            
            if radio < 5 {
                let alerta = UIAlertController(title: "Error", message: "Valor del radio no es aceptable", preferredStyle: .alert)
                
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
                chartView.animate(xAxisDuration: 2.5)
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
    
}
