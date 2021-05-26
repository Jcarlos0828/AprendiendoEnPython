//
//  Funciones.swift
//  Prototipo1
//
//  Created by user190015 on 4/17/21.
//    - Jose Carlos del Castillo Estrada | A00822554
//    - Adolfo Benjamin Lerma Villalobos | A00822029
//

import UIKit

class Funciones: NSObject {
    var tituloFunc: String
    var llamadoFuncs : [Int] //Indica cuantas lineas tienen que pasar para hacer un salto de llamado a funcion
    var largos : [Int] //Tiene el largo de cada linea a mostrar para el cursor
    
    init(tituloFunc : String, llamadoFuncs : [Int], largos : [Int]){
        self.tituloFunc = tituloFunc
        self.llamadoFuncs = llamadoFuncs
        self.largos = largos
    }
}
