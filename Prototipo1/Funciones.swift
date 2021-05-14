//
//  Funciones.swift
//  Prototipo1
//
//  Created by user190015 on 4/17/21.
//

import UIKit

class Funciones: NSObject {
    var tituloFunc: String
    var llamadoFuncs : [Int]
    var largos : [Int]
    
    init(tituloFunc : String, llamadoFuncs : [Int], largos : [Int]){
        self.tituloFunc = tituloFunc
        self.llamadoFuncs = llamadoFuncs
        self.largos = largos
    }
}
