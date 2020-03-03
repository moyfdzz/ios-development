//
//  ViewController.swift
//  ActClaseStoryboardsE20
//
//  Created by Yolanda Martinez on 25/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbNombreCliente: UILabel!
    @IBOutlet weak var tfNumCliente: UITextField!
    @IBOutlet weak var imgFotoCliente: UIImageView!
    
    var nombre : String!
    var num : String!
    var imagen : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindNombre(unwindSegue: UIStoryboardSegue) {
        lbNombreCliente.text = nombre
    }
    
    @IBAction func unwindFotoCel(unwindSegue: UIStoryboardSegue) {
        tfNumCliente.text = num
        imgFotoCliente.image = imagen
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editarNombre" {
            let vistaNombre = segue.destination as! ViewControllerNombre
            
            vistaNombre.tfInfoNombre.text = lbNombreCliente.text!
        }
        else {
            let vistaFotoCel = segue.destination as! ViewControllerFotoCel
            
            vistaFotoCel.tfInfoNum.text = tfNumCliente.text!
            vistaFotoCel.imgFoto.image = imgFotoCliente.image!
        }
    }
    
}

