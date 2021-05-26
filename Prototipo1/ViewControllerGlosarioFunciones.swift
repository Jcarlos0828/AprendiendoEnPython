//
//  ViewControllerGlosarioFunciones.swift
//  Prototipo1
//
//  Created by user189317 on 5/20/21.
//
//  Proyecto final desarrollado por:
//    - Jose Carlos del Castillo Estrada | A00822554
//    - Adolfo Benjamin Lerma Villalobos | A00822029
//

import UIKit

class ViewControllerGlosarioFunciones: UIViewController {
    @IBOutlet weak var fondo: UIView!
    
    var glosColor1 =  UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    var glosColor2 =  UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = glosColor1
        fondo.backgroundColor = glosColor2
     }
}
