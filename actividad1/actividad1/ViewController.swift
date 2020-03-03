//
//  ViewController.swift
//  actividad1
//
//  Created by Alumno on 17/02/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var vView: UIView!
    @IBOutlet weak var imgBall: UIImageView!
    @IBOutlet weak var sSlider: UISlider!

    @IBAction func changeSliderValue(_ sender: UISlider) {
        imgBall.frame.origin.x = vView.frame.origin.x * CGFloat(sSlider.value)
    }
    
    
    @IBOutlet weak var segCon: UISegmentedControl!
    @IBOutlet weak var lWord: UILabel!
    
    @IBAction func moveLabel(_ sender: UISegmentedControl) {
        if (segCon.selectedSegmentIndex == 0) {
            UIView.animate(withDuration:1) {
                self.lWord.frame.origin.x = CGFloat(50)
            }
        }
        else {
            UIView.animate(withDuration:1) {
                self.lWord.frame.origin.x = CGFloat(200)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

