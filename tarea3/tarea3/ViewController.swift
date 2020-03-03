//
//  ViewController.swift
//  tarea3
//
//  Created by Alumno on 03/03/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lbMeasurements: UILabel!
    @IBOutlet weak var lbCalculation: UILabel!
    
    var imagen : UIImage!
    var measurement : String!
    var calculation : String!
    
    @IBAction func unwindEsfera(unwindSegue : UIStoryboardSegue) {
        imgFoto.image = imagen!
        lbMeasurements.text = measurement!
        lbCalculation.text = calculation!
    }
    
    @IBAction func unwindPrisma(unwindSegue : UIStoryboardSegue) {
        imgFoto.image = imagen!
        lbMeasurements.text = measurement!
        lbCalculation.text = calculation!
    }
    
    @IBAction func limpiarInfo(_ sender: UIButton) {
        imgFoto.image = nil
        lbMeasurements.text = ""
        lbCalculation.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

