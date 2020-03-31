//
//  ViewControllerColores.swift
//  actividadProtocolos
//
//  Created by user168655 on 3/30/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

protocol protocoloCambiarColor {
    func cambiarColor(color : UIColor) -> Void
}

class ViewControllerColores: UIViewController {
    var delegado : protocoloCambiarColor!
    
    @IBAction func presionarBoton(_ sender: UIButton) {
        if let color = sender.backgroundColor {
            delegado.cambiarColor(color: color) // funciona color : color?
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
