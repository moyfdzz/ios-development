//
//  ViewController.swift
//  userDefaultsF20
//
//  Created by Yolanda Martinez on 15/04/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUsuario: UITextField!
    @IBOutlet weak var tfVolumen: UITextField!
    @IBOutlet weak var tfSonido: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        actualizaInterfaz()
    }

    func cambiaColorFondo(claveColor: Int) {
        
        var colorFondo : UIColor
        
        switch claveColor {
        case 0:  // Rojo
            colorFondo = UIColor(red: 255/255, green: 155/255, blue: 139/255, alpha: 1)
        case 1:  // Azul
            colorFondo = UIColor(red: 159/255, green: 209/255, blue: 255/255, alpha: 1)
        case 2:  // Verde
            colorFondo = UIColor(red: 174/255, green: 249/255, blue: 169/255, alpha: 1)
        case 3:  // Amarillo
            colorFondo = UIColor(red: 246/255, green: 255/255, blue: 160/255, alpha: 1)
        default:  // Rojo
            colorFondo = UIColor(red: 255/255, green: 252/255, blue: 213/255, alpha: 1)
        }
        view.backgroundColor = colorFondo
    }
    
    func actualizaInterfaz() {
        let defaults = UserDefaults.standard
        if let nom = defaults.value(forKey: "nombre") as? String {
            tfUsuario.text = nom
        }
        let valorVolumen = defaults.float(forKey: "volumen")
        tfVolumen.text = String(valorVolumen)
        let valorSonido = defaults.bool(forKey: "sonido")
        tfSonido.text = String(valorSonido)
        let colorFondo = defaults.integer(forKey: "claveColor")
        cambiaColorFondo(claveColor: colorFondo)
    }
    
    @IBAction func unwindSettings(segue: UIStoryboardSegue) {
        actualizaInterfaz()
    }
    
}

