//
//  Colores.swift
//  Prototipo1
//
//  Created by user190015 on 5/16/21.
//
//  Proyecto final desarrollado por:
//    - Jose Carlos del Castillo Estrada | A00822554
//    - Adolfo Benjamin Lerma Villalobos | A00822029
//

import UIKit

class Colores: NSObject {
    var nombre : String
    var paleta: [UIColor] //Guarda 5 colores
    
    init(nombre: String, paleta : [UIColor]){
        self.paleta = paleta
        self.nombre = nombre
    }

}
