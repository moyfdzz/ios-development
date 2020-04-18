//
//  TableViewController.swift
//  Tarea5
//
//  Created by user168655 on 4/16/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

class CustomTableViewCell : UITableViewCell {
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbSueldo: UILabel!
    @IBOutlet weak var lbDepartamento: UILabel!
}

class TableViewController: UITableViewController {
    
    let e1 = Empleado(nombre: "Abelardo", sueldo: 1111.11, foto: UIImage(named: "abelardo.png"), departamento: "Recursos Humanos")
    let e2 = Empleado(nombre: "Beto", sueldo: 2222.22, foto: UIImage(named: "beto.png"), departamento: "Finanzas")
    let e3 = Empleado(nombre: "Elmo", sueldo: 3333.33, foto: UIImage(named: "elmo.png"), departamento: "Deportes")
    let e4 = Empleado(nombre: "Enrique", sueldo: 4444.44, foto: UIImage(named: "enrique.png"), departamento: "Cocina")
    let e5 = Empleado(nombre: "Lucas", sueldo: 5555.55, foto: UIImage(named: "lucas.png"), departamento: "Videojuegos")
    
    var empleados = [Empleado]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        empleados = [e1, e2, e3, e4, e5]
        
        self.title = "Empleados"
        
        tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return empleados.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CustomTableViewCell
        
        cell.lbNombre.text = empleados[indexPath.row].nombre
        cell.lbSueldo.text = String(empleados[indexPath.row].sueldo)
        cell.lbDepartamento.text = empleados[indexPath.row].departamento
        cell.imgFoto.image = empleados[indexPath.row].foto
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.green
        }
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            empleados.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let temp = empleados[fromIndexPath.row]
        empleados[fromIndexPath.row] = empleados[to.row]
        empleados[to.row] = temp
        tableView.reloadData()
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
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
