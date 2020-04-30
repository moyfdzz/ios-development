//
//  ViewController.swift
//  Tarea6
//
//  Created by user168655 on 4/28/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

protocol protocoloAdministrarArticulos {
    func agregaArticulo(articulo: Articulo)
    func modificaArticulo(articulo: Articulo)
}

class ViewController: UIViewController {
    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfDescripcion: UITextField!
    @IBOutlet weak var tfCantidad: UITextField!
    
    var delegado: protocoloAdministrarArticulos!
    var articulo: Articulo!
    var agregarArticulo: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !agregarArticulo {
            title = "Modificar artículo"
            tfId.text = articulo.id
            tfDescripcion.text = articulo.descripcion
            tfCantidad.text = String(articulo.cantidad)
        }
        else {
            title = "Agregar artículo"
        }
        
        let tap = UIGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func quitaTeclado() {
        view.endEditing(true)
    }

    @IBAction func guardar(_ sender: UIButton) {
        if let id = tfId.text, let descripcion = tfDescripcion.text, let cantidad = Int(tfCantidad.text!) {
            if agregarArticulo {
                delegado.agregaArticulo(articulo: Articulo(id: id, descripcion: descripcion, cantidad: cantidad))
            } else {
                articulo.id = id
                articulo.descripcion = descripcion
                articulo.cantidad = cantidad
                delegado.modificaArticulo(articulo: articulo)
            }
            
            navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Por favor llena todos los campos.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

