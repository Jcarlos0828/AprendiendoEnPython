//
//  ViewControllerGlosario.swift
//  Prototipo1
//
//  Created by user189317 on 4/20/21.
//

import UIKit

class ViewControllerGlosario: UIViewController {

    @IBOutlet weak var lbGlosario: UILabel!
    
    //var menu = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str = """
                    Bienvenidos al Glosario de Python
                    
                    ¿Que es def en Pyhton?
                    Bueno en pyhton para poder definir una funcion se usa el def nombre_de_la_funcion(parametros):, el : es lo que usa Python para indicar que empieza la definicion.
                    Para despues llamar una funcion declarada solo se usa nombre_de_la_funcion(parametros)
                    """
        
        lbGlosario.text = str

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
