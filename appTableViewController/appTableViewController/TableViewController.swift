//
//  TableViewController.swift
//  appTableViewController
//
//  Created by Alumno on 05/03/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    // Crea un arreglo de objetos de tipo Jugador vacío.
    var listaJugadores = [Jugador]()
    
    // Crear el apuntador al arreglo de objetos sin crear el arreglo de objetos
    //var lista : [Jugador]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lista de Jugadores"

        let jug1 = Jugador(nombre: "David", puntos: 1800, email: "david@gmail.com")
        let jug2 = Jugador(nombre: "Rosy", puntos: 2000, email: "rosy@tec.mx")
        let jug3 = Jugador(nombre: "Karla", puntos: 2500, email: "karla@gmail.com")
        
        listaJugadores += [jug1, jug2, jug3]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaJugadores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = listaJugadores[indexPath.row].nombre
        cell.imageView?.image = UIImage(named: "user")

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaDetalle = segue.destination as! ViewController
        let indice = tableView.indexPathForSelectedRow!
        
        vistaDetalle.jug = listaJugadores[indice.row]
    }
    

}
