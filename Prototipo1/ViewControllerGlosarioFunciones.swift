//
//  ViewControllerGlosarioFunciones.swift
//  Prototipo1
//
//  Created by user189317 on 5/20/21.
//

import UIKit

class ViewControllerGlosarioFunciones: UIViewController {
    @IBOutlet weak var fondo: UIView!
    
    var glosColor1 =  UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    var glosColor2 =  UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    
    //var menu = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("debugger")
        print(glosColor1)
        print(glosColor2)
        print("------------")
        view.backgroundColor = glosColor1
        fondo.backgroundColor = glosColor2

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
