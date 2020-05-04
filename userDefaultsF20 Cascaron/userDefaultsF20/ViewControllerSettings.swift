//
//  ViewControllerSettings.swift
//  userDefaultsF20
//
//  Created by Yolanda Martinez on 15/04/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerSettings: UIViewController {
    
    @IBOutlet weak var tfNombreUsuario: UITextField!
    @IBOutlet weak var scColorFondo: UISegmentedControl!
    @IBOutlet weak var sVolumen: UISlider!
    @IBOutlet weak var sSonido: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        
        if let nom = defaults.value(forKey: "nombre") as? String {
            tfNombreUsuario.text = nom
        }
        sVolumen.value = defaults.float(forKey: "volumen")
        sSonido.isOn = defaults.bool(forKey: "sonido")
        scColorFondo.selectedSegmentIndex = defaults.integer(forKey: "claveColor")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defaults = UserDefaults.standard
        
        defaults.set(tfNombreUsuario.text, forKey: "nombre")
        defaults.set(scColorFondo.selectedSegmentIndex, forKey: "claveColor")
        defaults.set(sVolumen.value, forKey: "volumen")
        defaults.set(sSonido.isOn, forKey: "sonido")
    }
        

}

