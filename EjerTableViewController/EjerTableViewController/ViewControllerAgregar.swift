//
//  ViewControllerAgregar.swift
//  EjerTableViewController
//
//  Created by user168655 on 3/26/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

protocol protocoloAgregarJugador {
    func agregarJugador(jug : Jugador) -> Void
}

class ViewControllerAgregar: UIViewController {

    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfPuntos: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    var delegado : protocoloAgregarJugador!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
