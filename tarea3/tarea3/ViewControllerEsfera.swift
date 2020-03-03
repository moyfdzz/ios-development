//
//  ViewControllerEsfera.swift
//  tarea3
//
//  Created by Alumno on 03/03/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewControllerEsfera: UIViewController {
    
    @IBOutlet weak var imgEsfera: UIImageView!
    @IBOutlet weak var tfRadio: UITextField!
    
    var validRadio : Double!
    var vol : Double!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let radio = Double(tfRadio.text!) {
            vol = 4/3 * 3.1415926535 * pow(radio, 3)
            validRadio = radio
            
            return true;
        }
        else {
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
        vistaIni.imagen = imgEsfera.image!
        vistaIni.measurement = "Radio = \(String(describing: validRadio!))"
        vistaIni.calculation = String(vol)
    }
    

}
