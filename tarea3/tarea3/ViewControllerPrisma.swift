//
//  ViewControllerPrisma.swift
//  tarea3
//
//  Created by Alumno on 03/03/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewControllerPrisma: UIViewController {
    
    @IBOutlet weak var imgPrisma: UIImageView!
    @IBOutlet weak var tfLargo: UITextField!
    @IBOutlet weak var tfAncho: UITextField!
    @IBOutlet weak var tfAltura: UITextField!

    var validLargo : Double!
    var validAncho : Double!
    var validAltura : Double!
    var vol : Double!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let largo = Double(tfLargo.text!), let ancho = Double(tfAncho.text!), let altura = Double(tfAltura.text!) {
            vol = largo * ancho * altura
            validLargo = largo
            validAncho = ancho
            validAltura = altura
            
            return true;
        }
        else {
            let alerta =
                UIAlertController(title: "Error", message: "Por favor ingrese valores numéricos.", preferredStyle: .alert)
            
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            present(alerta, animated: true, completion: nil)
            
            return false;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vistaIni = segue.destination as! ViewController
        vistaIni.imagen = imgPrisma.image!
        vistaIni.measurement = "largo = \(String(describing: validLargo!)) \n ancho = \(String(describing: validAncho!)) \n altura = \(String(describing: validAltura!))"
        vistaIni.calculation = String(vol)
    }
    

}
