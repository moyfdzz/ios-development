//
//  ViewController.swift
//  appTableViewController
//
//  Created by Alumno on 05/03/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfPuntos: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    var jug : Jugador!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfNombre.text = jug.nombre
        tfPuntos.text = String(jug.puntos)
        tfEmail.text = jug.email
    }


}

