//
//  TableViewController.swift
//  Tarea6
//
//  Created by user168655 on 4/29/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, protocoloAdministrarArticulos {
    
    func agregaArticulo(articulo: Articulo) {
        listaArticulos.append(articulo)
        tableView.reloadData()
    }
    
    func modificaArticulo(articulo: Articulo) {
        tableView.reloadData()
    }
    
    var listaArticulos: [Articulo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Artículos"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let app = UIApplication.shared
        
        NotificationCenter.default.addObserver(self, selector: #selector(guardarArticulos), name: UIApplication.didEnterBackgroundNotification, object: app)
        
        if FileManager.default.fileExists(atPath: dataFileURL().path) {
            obtenerArticulos()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaArticulos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let articulo = listaArticulos[indexPath.row]
        cell.textLabel?.text = articulo.id
        cell.detailTextLabel?.text = articulo.descripcion
        
        return cell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaArticulo = segue.destination as! ViewController
        
        vistaArticulo.delegado = self
        
        if segue.identifier == "muestra" {
            vistaArticulo.agregarArticulo = false
            vistaArticulo.articulo = listaArticulos[tableView.indexPathForSelectedRow!.row]
        } else {
            vistaArticulo.agregarArticulo = true
        }
    }
    
    func dataFileURL() -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = url.appendingPathComponent("Articulos.plist")
        return pathArchivo
    }
    
    @IBAction func guardarArticulos() {
        do {
            let data = try PropertyListEncoder().encode(listaArticulos)
            try data.write(to: dataFileURL())
        }
        catch {
            print("Error al guardar los datos")
        }
    }
    
    func obtenerArticulos() {
        listaArticulos.removeAll()
        
        do {
            let data = try Data.init(contentsOf: dataFileURL())
            listaArticulos = try PropertyListDecoder().decode([Articulo].self, from: data)
        }
        catch {
            print("Error al cargar los datos del archivo")
        }
        
        tableView.reloadData()
    }
}
