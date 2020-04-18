//
//  ViewController.swift
//  MiniReto2
//
//  Created by user168655 on 4/14/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tfNombreC: UITextField!
    @IBOutlet weak var tvTablaC: UITableView!
    
    var posiblesColores : [UIColor] = []
    var delegado : administraCategoria!
    var disponible : Bool = true
    var cat = Categoria(titulo: "", color: UIColor.white)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posiblesColores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.backgroundColor = posiblesColores[indexPath.row]
        
        cell.backgroundColor?.withAlphaComponent(0.75)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Administrar categoría"
        
        if !disponible {
            tfNombreC.isUserInteractionEnabled = false
            self.view.backgroundColor = cat.color
            tfNombreC.text = cat.titulo
        }
        
        tvTablaC.delegate = self
        tvTablaC.dataSource = self
    }


}

