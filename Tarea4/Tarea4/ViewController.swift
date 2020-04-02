//
//  ViewController.swift
//  Tarea4
//
//  Created by user168655 on 3/31/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let slot = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 60))
        
        slot.image = images[row]

        return slot
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 70
    }
        
    @IBOutlet weak var vWin: UIView!
    @IBOutlet weak var pvSlots: UIPickerView!
    
    var images: [UIImage] = [UIImage(named: "Apple")!, UIImage(named: "bar")!, UIImage(named: "cherry")!, UIImage(named: "crown")!, UIImage(named: "lemon")!, UIImage(named: "seven")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pvSlots.delegate = self
        self.pvSlots.dataSource = self
        
        vWin.isHidden = true
    }

    @IBAction func playGame(_ sender: UIButton) {
        if (vWin.isHidden) {
            for index in 0...2 {
                let random = Int.random(in: 0...images.count)
                
                pvSlots.selectRow(random, inComponent: index, animated: true)
            }
            
            if (pvSlots.selectedRow(inComponent: 0) == pvSlots.selectedRow(inComponent: 1) && pvSlots.selectedRow(inComponent: 1) == pvSlots.selectedRow(inComponent: 2)) {
                vWin.isHidden = false
            }
        }
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        vWin.isHidden = true
        
        for index in 0...2 {
            pvSlots.selectRow(0, inComponent: index, animated: true)
        }
    }
}

