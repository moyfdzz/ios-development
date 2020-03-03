//
//  ViewControllerNombre.swift
//  ActClaseStoryboardsE20
//
//  Created by Alumno on 27/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerNombre: UIViewController {

    @IBOutlet weak var tfInfoNombre: UITextField!
    
    var infoNombre : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tfInfoNombre.text = String(describing: infoNombre!)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vistaIni = segue.destination as! ViewController
        
        vistaIni.lbNombreCliente.text = tfInfoNombre.text!
    }
    

}
