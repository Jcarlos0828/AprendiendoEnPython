//
//  VisualCodeViewController.swift
//  Prototipo1
//
//  Created by user190015 on 4/17/21.
//

import UIKit

class VisualCodeViewController: UIViewController {

    @IBOutlet weak var lbTituloFunc: UILabel!
    @IBOutlet weak var lbshadow: UILabel!
    var numlineasFunc1 = 0
    var numlineasFunc2 = 0
    var xmain = 0
    var xfun = 0
    var ymain = 0
    var yfun = 0
    var numAbajo = 0
    var numlineastotales = 0
    var tempymain = 0
    var main = true
    var cambio = false
    
    
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
        
        xmain = Int(lbVariable1.frame.origin.x)
        xfun = Int(lbVariable2.frame.origin.x)
        ymain = Int(lbVariable1.frame.origin.y) + 46
        yfun = Int(lbVariable2.frame.origin.y) + 46
        
        print(xmain)
        print(ymain)
        
        
        if numAbajo == 0{
            lbshadow.isHidden = true
            lbshadow.frame.origin.x = CGFloat(xmain)
            lbshadow.frame.origin.y = CGFloat(ymain)
            numlineastotales = numlineasFunc1 + numlineasFunc2
            
        }
        
        lbTituloFunc.text = funcSelecc.tituloFunc
        
        
        lbVariable1.text = lbFuncVar1
        lbVariable2.text = lbFuncVar2
        lbvalorVariable_1.text = lbFuncVal1
        lbvalorVariable_2.text = lbFuncVal2
        
        tfvalorVariable_1.isHidden = true
        tfvalorVariable_2.isHidden = true
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
    
    
    @IBAction func siguienteLinea(_ sender: Any) {
        
        if numAbajo == 0{
            lbshadow.isHidden = false
        }
        
        if(numAbajo < numlineastotales - 1){
            
            numAbajo = numAbajo + 1
            print(numAbajo)
            
            
            if main {
                if(numAbajo >= numlineasFunc1){
                    main = false
                    tempymain = Int(lbshadow.frame.origin.y)
                    lbshadow.frame.origin.y = CGFloat(yfun)
                } else {
                    UIView.animate(withDuration: 1){
                        self.lbshadow.frame.origin.y += 20
                    }
                }
            } else {
                UIView.animate(withDuration: 1){
                    self.lbshadow.frame.origin.y += 20
                }
            }
            

        }
        
        
        
    }
    
    
    
    @IBAction func lineaAtras(_ sender: Any) {
        if numAbajo > 0 {
            numAbajo = numAbajo - 1
            
            print(numAbajo)
            
            if numAbajo == 0{
                lbshadow.isHidden = true
                lbshadow.frame.origin.y = CGFloat(ymain)
            } else {
                if !main {
                    if numAbajo < numlineasFunc1 {
                        main = true
                        lbshadow.frame.origin.y = CGFloat(tempymain)
                    } else {
                        UIView.animate(withDuration: 1){
                            self.lbshadow.frame.origin.y -= 20
                        }
                    }
                    
                } else {
                    UIView.animate(withDuration: 1){
                        self.lbshadow.frame.origin.y -= 20
                    }
                }
            }
        }
    }
    
    
    @IBAction func unwindGlosarioFuncion(segue: UIStoryboardSegue){
        
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
