//
//  ViewController.swift
//  storyboardsE20 p-completar
//
//  Created by Alumno on 24/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    var nombre: String!
    var email: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindEditar(unwindSegue: UIStoryboardSegue) {
        tfNombre.text = nombre
        tfEmail.text = email
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "info" {
            
            let visitaInfo = segue.destination as! ViewControllerInfo
            visitaInfo.foto = imgFoto.image
            visitaInfo.ancho = imgFoto.image?.size.width
            visitaInfo.altura = imgFoto.image?.size.height
        }
        else {
            let vistaEditar = segue.destination as! ViewControllerEditar
            vistaEditar.nombre = tfNombre.text
            vistaEditar.email = tfEmail.text
        }
    }
    

}
