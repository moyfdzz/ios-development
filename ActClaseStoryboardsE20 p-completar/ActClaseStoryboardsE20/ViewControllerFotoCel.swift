//
//  ViewControllerFotoCel.swift
//  ActClaseStoryboardsE20
//
//  Created by Alumno on 27/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerFotoCel: UIViewController {

    @IBOutlet weak var tfInfoNum: UITextField!
    @IBOutlet weak var imgFoto: UIImageView!
    
    var imagen : UIImage!
    var infoNum : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tfInfoNum.text = infoNum
        imgFoto.image = imagen
        tfInfoNum.text = String(describing: infoNum!)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vistaIni = segue.destination as! ViewController
        
        vistaIni.imgFotoCliente.image = imgFoto.image
        vistaIni.tfNumCliente.text = tfInfoNum.text
    }
    

}
