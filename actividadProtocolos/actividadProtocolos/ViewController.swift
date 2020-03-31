//
//  ViewController.swift
//  actividadProtocolos
//
//  Created by user168655 on 3/30/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

class ViewController: UIViewController, protocoloCambiarColor {
    func cambiarColor(color : UIColor) {
        vColor.backgroundColor = color
    }

    @IBOutlet weak var vColor: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewColores = segue.destination as! ViewControllerColores
        viewColores.delegado = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

