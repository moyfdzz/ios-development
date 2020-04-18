//
//  Categoria.swift
//  MiniReto2
//
//  Created by user168655 on 4/14/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

class Categoria: NSObject {
    var titulo : String
    var color : UIColor
    
    init(titulo: String, color: UIColor) {
        self.titulo = titulo
        self.color = color
    }
}
