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
    @IBOutlet weak var vUserAnswer1: UIView!
    @IBOutlet weak var vUserAnswer2: UIView!
    @IBOutlet weak var vUserAnswer3: UIView!
    @IBOutlet weak var vUserAnswer4: UIView!
    @IBOutlet weak var bUserButton1: UIButton!
    @IBOutlet weak var bUserButton2: UIButton!
    @IBOutlet weak var bUserButton3: UIButton!
    @IBOutlet weak var bUserButton4: UIButton!
    @IBOutlet weak var vTry1: UIView!
    @IBOutlet weak var vTry2: UIView!
    @IBOutlet weak var vTry3: UIView!
    @IBOutlet weak var bTry: UIButton!
    
    // Borrar los botones y ponerlos otra vez de la library
    // También borrarlos de arriba con click derecho
    
    let colorsSequence = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.brown, UIColor.purple, UIColor.green]
    var numberTries : Int = 0
    lazy var tries = [vTry1, vTry2, vTry3]
    lazy var answers = [vAnswer1, vAnswer2, vAnswer3, vAnswer4]
    lazy var userAnswers = [vUserAnswer1, vUserAnswer2, vUserAnswer3, vUserAnswer4]
    lazy var userButtons = [bUserButton1, bUserButton2, bUserButton3, bUserButton4]
    
    func displayAnswer(status: Bool) {
        vContainer.isHidden = status
        vAnswer1.isHidden = status
        vAnswer2.isHidden = status
        vAnswer3.isHidden = status
        vAnswer4.isHidden = status
    }
    
    @IBAction func addTries(_ sender: UIButton) {
        tries[numberTries]?.isHidden = false
        numberTries += 1
    }
    
    func changeColor() {
        var counter : Int = 0
        
        for button in userButtons {
            if button?.isTouchInside == true {
                for color in colorsSequence {
                    if userAnswers[counter]?.backgroundColor == color && counter != 5 {
                        userAnswers[counter]?.backgroundColor = colorsSequence[counter + 1]
                    }
                    else {
                        userAnswers[counter]?.backgroundColor = colorsSequence[0]
                    }
                }
            }
            
            counter += 1
        }
    }
    
    @IBAction func changeMode(_ sender: UISegmentedControl) {
        changeColor()
        
        // Modo jugar.
        if sControl.selectedSegmentIndex == 1 {
            displayAnswer(status: false)
            addTries(bTry)
        }
        else { // Modo probar.
            displayAnswer(status: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sControl.selectedSegmentIndex = 1
        vTry1.isHidden = true
        vTry2.isHidden = true
        vTry3.isHidden = true
    }
}

