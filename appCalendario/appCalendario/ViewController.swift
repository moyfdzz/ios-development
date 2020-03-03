//
//  ViewController.swift
//  appCalendario
//
//  Created by Alumno on 26/02/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lYear: UILabel!
    @IBOutlet weak var lMonth: UILabel!
    @IBOutlet weak var lDayNumbers: UILabel!
    @IBOutlet weak var lDayLetters: UILabel!
    
    let date = Date()
    let dateFormat = DateFormatter()
    let oneDay = 86400
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormat.dateFormat = "yyyy"
        lYear.text = dateFormat.string(from: date)
        dateFormat.dateFormat = "MMM"
        lMonth.text = dateFormat.string(from: date)
        dateFormat.dateFormat = "ddd"
        lDayLetters.text = dateFormat.string(from: date)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunction(gesture:)))
        leftSwipe.direction = .left

        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunction(gesture:)))
        rightSwipe.direction = .right
        
        self.view.addGestureRecognizer(leftSwipe)
        self.view.addGestureRecognizer(rightSwipe)
    }

    @IBAction func swipeFunction(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            
        }
        else {

        }
    }

}

