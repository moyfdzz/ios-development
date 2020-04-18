//
//  TableViewController.swift
//  MiniReto2
//
//  Created by user168655 on 4/14/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

protocol administraCategoria {
    func agregaCategoria(categoria: Categoria)->Void
    func modificaCategoria(categoria: Categoria)->Void
}

class TableViewController: UITableViewController, administraCategoria {
    var categorias: [Categoria] = []
    var posiblesColores: [UIColor] = [UIColor.blue, UIColor.green, UIColor.purple, UIColor.red, UIColor.yellow, UIColor.orange, UIColor.cyan]
    var indiceAux: Int = 0
    
    func agregaCategoria(categoria: Categoria) {
        posiblesColores = posiblesColores.filter{$0 != categoria.color}
        
        categorias.append(categoria)
        
        tableView.reloadData()
    }
    
    func modificaCategoria(categoria: Categoria) {
        categorias[indiceAux] = categoria
        
        posiblesColores = posiblesColores.filter{$0 != categoria.color}
        posiblesColores.append(categoria.color)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Categorías"
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorias.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = categorias[indexPath.row].titulo
        cell.backgroundColor = categorias[indexPath.row].color
        
        cell.backgroundColor?.withAlphaComponent(0.75)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! ViewController
        
        destino.delegado = self
        destino.posiblesColores = posiblesColores
        
        if segue.identifier == "" {
            destino.disponible = true
            destino.title = "Nueva Categoría"
        } else {
            destino.disponible = false
            destino.title = "Modificar Categoría"
            let indexPath = tableView.indexPathForSelectedRow!
            destino.cat = categorias[indexPath.row]
            indiceAux = indexPath.row
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
