//
//  Articulo.swift
//  Tarea6
//
//  Created by user168655 on 4/29/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

class Articulo: NSObject, Codable {
    var id: String
    var descripcion: String
    var cantidad: Int
    
    init(id: String, descripcion: String, cantidad: Int) {
        self.id = id
        self.descripcion = descripcion
        self.cantidad = cantidad
    }
}
