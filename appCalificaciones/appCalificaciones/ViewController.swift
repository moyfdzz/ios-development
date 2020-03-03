//
//  ViewController.swift
//  appCalificaciones
//
//  Created by Alumno on 19/02/20.
//  Copyright © 2020 ITESM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfParciales: UITextField!
    @IBOutlet weak var tfActividades: UITextField!
    @IBOutlet weak var lExamenFinal: UILabel!
    @IBOutlet weak var tfExamenFinal: UITextField!
    @IBOutlet weak var sCalcular: UISwitch!
    @IBOutlet weak var bCalcular: UIButton!
    @IBOutlet weak var lNota: UILabel!
    @IBOutlet weak var tfNota: UITextField!
    
    @IBAction func cambiarCalculo(_ sender: UISwitch) {
        if (sCalcular.isOn) {
            lExamenFinal.isHidden = false
            tfExamenFinal.isHidden = false
            
            tfParciales.text = ""
            tfActividades.text = ""
            tfExamenFinal.text = ""
            tfNota.text = ""
            
            lNota.text = "Nota final"
            bCalcular.setTitle("Calcula Nota Final", for: .normal)
        }
        else {
            lExamenFinal.isHidden = true
            tfExamenFinal.isHidden = true
            
            tfParciales.text = ""
            tfActividades.text = ""
            tfNota.text = ""
            
            lNota.text = "Nota para pasar"
            bCalcular.setTitle("Calcula Nota Pasar", for: .normal)
        }
    }
    
    @IBAction func calcularNota(_ sender: UIButton) {
        if (sCalcular.isOn) {
            if let parciales = Double(tfParciales.text!),
                let actividades = Double(tfActividades.text!),
                let examenFinal = Double(tfExamenFinal.text!){

                let notaFinal = (parciales * 0.50) + (actividades * 0.20) + (examenFinal * 0.30)
                
                tfNota.text = "\(notaFinal)"
            }
            else {
                let alerta = UIAlertController(title: "Error", message: "Los campos deben tener dato", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alerta.addAction(accion)
                
                present(alerta, animated: true, completion: nil)
            }
        }
        else {
            if let parciales = Double(tfParciales.text!),
                let actividades = Double(tfActividades.text!) {

                let notaActual = (parciales * 0.50) + (actividades * 0.20)
                let notaPasar = (70 - notaActual) / 0.30
                
                tfNota.text = "\(notaPasar)"
            }
            else {
                let alerta = UIAlertController(title: "Error", message: "Los campos deben tener dato", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alerta.addAction(accion)
                
                present(alerta, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func quitaTeclado() {
        view.endEditing(true)
    }


}

