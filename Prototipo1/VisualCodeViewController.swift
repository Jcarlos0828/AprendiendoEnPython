//
//  VisualCodeViewController.swift
//  Prototipo1
//
//  Created by user190015 on 4/17/21.
//

import UIKit

class VisualCodeViewController: UIViewController {

    @IBOutlet weak var lbTituloFunc: UILabel!
    var numlineasFunc1 = 0
    var numlineasFunc2 = 0
    var saltosCodigo = [-1]
    
    //Variables del shadow que indica "cursor" de linea actual
    @IBOutlet weak var lbshadow: UILabel!
    var xmain = 0
    var xfun = 0
    var ymain = 0
    var yfun = 0
    var numAbajo = 0
    
    var numlineastotales = 0
    var tempymain = CGFloat()
    var main = true
    var cambio = false
    
    
    @IBOutlet weak var lbVariable1: UILabel!
    @IBOutlet weak var lbvalorVariable_1: UILabel!
    
    @IBOutlet weak var lbVariable2: UILabel!
    
    
    
    
    @IBOutlet weak var tfVariable1_Func2: UITextField!
    @IBOutlet weak var tfVariable2_Func2: UITextField!
    @IBOutlet weak var tfVariable3_Func2: UITextField!
    @IBOutlet weak var tfVariable4_Func2: UITextField!
    @IBOutlet weak var tfVariable5_Func2: UITextField!
    @IBOutlet weak var tfVariable6_Func2: UITextField!
    
    
    var funcSelecc : Funciones!
    var indexSaltos : [Int] = []
    var lbMain : String!
    var lbFuncsAux : String!
    var lbFuncVal1 : String!
    var lbFuncVal2 : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xmain = Int(lbVariable1.frame.origin.x)
        xfun = Int(lbVariable2.frame.origin.x)
        ymain = Int(lbVariable1.frame.origin.y) + 46
        yfun = Int(lbVariable2.frame.origin.y) + 46
        //print(xmain)
        //print(ymain)
        
        
        if numAbajo == 0{
            lbshadow.isHidden = true
            lbshadow.frame.origin.x = CGFloat(xmain)
            lbshadow.frame.origin.y = CGFloat(ymain)
            numlineastotales = numlineasFunc1 + numlineasFunc2
            
        }
        
        lbTituloFunc.text = funcSelecc.tituloFunc
        
        lbVariable1.text = lbMain
        lbVariable2.text = lbFuncsAux
        lbvalorVariable_1.text = lbFuncVal1
        
        tfVariable1_Func2.isHidden = true
        tfVariable2_Func2.isHidden = true
        tfVariable3_Func2.isHidden = true
        tfVariable4_Func2.isHidden = true
        tfVariable5_Func2.isHidden = true
        tfVariable6_Func2.isHidden = true
        
    }
    
    @IBAction func cambiaModo(_ sender: UISegmentedControl) {
        
        tfVariable1_Func2.isHidden = !tfVariable1_Func2.isHidden
        tfVariable2_Func2.isHidden = !tfVariable2_Func2.isHidden
        tfVariable3_Func2.isHidden = !tfVariable3_Func2.isHidden
        if funcSelecc.tituloFunc == "Funcion 2"{
            lbvalorVariable_1.isHidden = !lbvalorVariable_1.isHidden
            
            
            tfVariable4_Func2.isHidden = !tfVariable4_Func2.isHidden
            tfVariable5_Func2.isHidden = !tfVariable5_Func2.isHidden
            tfVariable6_Func2.isHidden = !tfVariable6_Func2.isHidden
        }
    }
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
    
    
    @IBAction func siguienteLinea(_ sender: Any) {
        
        if numAbajo == 0{
            lbshadow.isHidden = false
        }
        
        if(numAbajo < numlineastotales){
            
            numAbajo = numAbajo + 1
            print(numAbajo)
            
            lbshadow.frame = CGRect(x: lbshadow.frame.minX, y: lbshadow.frame.minY, width: CGFloat(funcSelecc.largos[numAbajo]), height: lbshadow.frame.height)
            print(lbshadow.frame)
            // >= funcSelecc.llamadoFuncs[0]
            if main {
                if(numAbajo >= indexSaltos[0]){
                    saltosCodigo.insert( indexSaltos.removeFirst(), at: 0)
                    main = false
                    tempymain = lbshadow.frame.origin.y
                    lbshadow.frame.origin.y = CGFloat(yfun)
                    print("ya se movio la sombra, tempymain = ", tempymain)
                } else {
                    UIView.animate(withDuration: 1){
                        self.lbshadow.frame.origin.y += 20
                        print(self.lbshadow.frame.origin.y)
                    }
                }
            } else {
                if(numAbajo >= indexSaltos[0]){
                    saltosCodigo.insert( indexSaltos.removeFirst(), at: 0)
                    indexSaltos.append(100)
                    main = true
                    let aux = lbshadow.frame.origin.y
                    lbshadow.frame.origin.y = tempymain
                    tempymain = aux
                }
                else{
                    UIView.animate(withDuration: 1){
                        self.lbshadow.frame.origin.y += 20
                        print(self.lbshadow.frame.origin.y)
                    }
                }
            }
        }
        
    }
    
    
    
    @IBAction func lineaAtras(_ sender: Any) {
        if numAbajo > 0 {
            numAbajo = numAbajo - 1
            
            print(numAbajo)
            lbshadow.frame = CGRect(x: lbshadow.frame.minX, y: lbshadow.frame.minY, width: CGFloat(funcSelecc.largos[numAbajo]), height: lbshadow.frame.height)
            
            if numAbajo == 0{
                lbshadow.isHidden = true
                lbshadow.frame.origin.y = CGFloat(ymain)
            } else {
                if !main {
                    if numAbajo < saltosCodigo[0] {
                        indexSaltos.insert(saltosCodigo.removeFirst(), at: 0)
                        main = true
                        lbshadow.frame.origin.y = tempymain
                    } else {
                        UIView.animate(withDuration: 1){
                            self.lbshadow.frame.origin.y -= 20
                        }
                    }
                    
                } else {
                    if numAbajo < saltosCodigo[0]{
                        indexSaltos.insert(saltosCodigo.removeFirst(), at: 0)
                        main = false
                        let aux = lbshadow.frame.origin.y
                        lbshadow.frame.origin.y = tempymain
                        tempymain = aux
                    }
                    else{
                        UIView.animate(withDuration: 1){
                            self.lbshadow.frame.origin.y -= 20
                        }
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
