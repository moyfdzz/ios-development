//
//  ViewController.swift
//  appTableView
//
//  Created by Alumno on 02/03/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "idCell")!
        celda.textLabel?.text = lista[indexPath.row]
        let tipoLetra = UIFont(name: "Palatino", size: 30)
        celda.textLabel?.textColor = UIColor.white
        celda.textLabel?.font = tipoLetra
        
        celda.detailTextLabel?.text = String(indexPath.row)
        celda.imageView?.image = UIImage(named: "user")
        
        return celda
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var lista = ["Carlos", "Eriq", "Carrillo", "Memo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lista Datos"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaDetalle = segue.destination as! ViewControllerDetalle
        
        let indice = tableView.indexPathForSelectedRow!
        
        vistaDetalle.datoMostrar = lista[indice.row]
    }


}

