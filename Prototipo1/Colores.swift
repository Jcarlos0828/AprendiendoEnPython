//
//  Colores.swift
//  Prototipo1
//
//  Created by user190015 on 5/16/21.
//

import UIKit

class Colores: NSObject {
    var nombre : String
    var paleta: [UIColor]
    
    init(nombre: String, paleta : [UIColor]){
        self.paleta = paleta
        self.nombre = nombre
    }

}
