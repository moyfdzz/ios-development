//
//  ViewController.swift
//  miniReto1
//
//  Created by Alumno on 03/03/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sControl: UISegmentedControl!
    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var vAnswer1: UIView!
    @IBOutlet weak var vAnswer2: UIView!
    @IBOutlet weak var vAnswer3: UIView!
    @IBOutlet weak var vAnswer4: UIView!
    
    let colorsAvailable = [".red", ".blue", ".green", ".yellow", ".black", ".brown"]
    let numberTries : Int!
    
    func displayAnswer(status: Bool) {
        vContainer.isHidden = status
        vAnswer1.isHidden = status
        vAnswer2.isHidden = status
        vAnswer3.isHidden = status
        vAnswer4.isHidden = status
    }
    
    @IBAction func changeMode(_ sender: UISegmentedControl) {
        // Modo jugar.
        if sControl.selectedSegmentIndex == 1 {
            displayAnswer(status: false)
        }
        else { // Modo probar.
            displayAnswer(status: true)
        }
    }
    
    @IBAction func addTries(_ sender: UIButton) {
        if sControl.selectedSegmentIndex == 1 {
            init(CGRect(x: 228, y: 517, width: 50, height: 50))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sControl.selectedSegmentIndex = 1
    }


}

