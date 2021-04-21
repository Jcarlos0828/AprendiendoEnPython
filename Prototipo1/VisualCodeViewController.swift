//
//  VisualCodeViewController.swift
//  Prototipo1
//
//  Created by user190015 on 4/17/21.
//

import UIKit

class VisualCodeViewController: UIViewController {

    @IBOutlet weak var lbTituloFunc: UILabel!
    
    
    @IBOutlet weak var lbVariable1: UILabel!
    @IBOutlet weak var lbvalorVariable_1: UILabel!
    @IBOutlet weak var tfvalorVariable_1: UITextField!
    
    @IBOutlet weak var lbVariable2: UILabel!
    @IBOutlet weak var tfvalorVariable_2: UITextField!
    @IBOutlet weak var lbvalorVariable_2: UILabel!
    
    var funcSelecc : Funciones!
    var lbFuncVar1 : String!
    var lbFuncVar2 : String!
    var lbFuncVal1 : String!
    var lbFuncVal2 : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbTituloFunc.text = funcSelecc.tituloFunc
        
        lbVariable1.text = lbFuncVar1
        lbVariable2.text = lbFuncVar2
        lbvalorVariable_1.text = lbFuncVal1
        lbvalorVariable_2.text = lbFuncVal2
        
        tfvalorVariable_1.isHidden = true
        tfvalorVariable_2.isHidden = true
<<<<<<< HEAD
    }
    
    @IBAction func cambiaModo(_ sender: UISegmentedControl) {
        lbvalorVariable_1.isHidden = !lbvalorVariable_1.isHidden
        lbvalorVariable_2.isHidden = !lbvalorVariable_2.isHidden
        
        tfvalorVariable_1.isHidden = !tfvalorVariable_1.isHidden
        tfvalorVariable_2.isHidden = !tfvalorVariable_2.isHidden
    }
    
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
    @IBAction func unwindGlosarioFuncion(segue: UIStoryboardSegue){
        
    }
=======
    }
    
    @IBAction func cambiaModo(_ sender: UISegmentedControl) {
        lbvalorVariable_1.isHidden = !lbvalorVariable_1.isHidden
        lbvalorVariable_2.isHidden = !lbvalorVariable_2.isHidden
        
        tfvalorVariable_1.isHidden = !tfvalorVariable_1.isHidden
        tfvalorVariable_2.isHidden = !tfvalorVariable_2.isHidden
    }
    
    
>>>>>>> main

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
