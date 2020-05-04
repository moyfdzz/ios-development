//
//  Numero.swift
//  ActividadCodable
//
//  Created by user168655 on 4/30/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

class Numero: NSObject, Codable {
    var valor: Int
    
    init(valor: Int) {
        self.valor = valor
    }
}
