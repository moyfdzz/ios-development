//
//  Empleado.swift
//  Tarea5
//
//  Created by user168655 on 4/16/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

class Empleado: NSObject {
    var nombre : String
    var sueldo : Float
    var foto : UIImage
    var departamento : String
    
    init(nombre : String, sueldo : Float, foto : UIImage!, departamento : String) {
        self.nombre = nombre
        self.sueldo = sueldo
        self.foto = foto
        self.departamento = departamento
    }
}
