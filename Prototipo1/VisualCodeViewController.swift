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
    var offsetmain = 0
    var offsetfun = 0
    var llamadamainy = 0
    
    var codeColor1 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    var codeColor2 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    var codeColor3 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    var codeColor4 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    var codeColor5 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    @IBOutlet weak var fondo: UIView!
    @IBOutlet weak var consola: UIView!
    @IBOutlet weak var barraMedio: UIView!
    @IBOutlet weak var flechaIzq: UIButton!
    @IBOutlet weak var flechaDer: UIButton!
    @IBOutlet weak var reset: UIButton!
    
    
    @IBOutlet weak var lbVariable1: UILabel!
    @IBOutlet weak var lbVariable2: UILabel!
    
    
    
    
    @IBOutlet weak var tfVariable1_Func2: UITextField!
    var cteVar1 = "10"
    var auxCte1 = "10"
    @IBOutlet weak var tfVariable2_Func2: UITextField!
    var cteVar2 = "15"
    var auxCte2 = "15"
    @IBOutlet weak var tfVariable3_Func2: UITextField!
    var cteVar3 = "20"
    var auxCte3 = "20"
    @IBOutlet weak var tfVariable4_Func2: UITextField!
    var auxCte4 = "1000"
    @IBOutlet weak var tfVariable5_Func2: UITextField!
    var auxCte5 = "1000"
    @IBOutlet weak var tfVariable6_Func2: UITextField!
    var auxCte6 = "1000"
    @IBOutlet weak var control: UISegmentedControl!
    @IBOutlet weak var lbCodigo: UILabel!
    var lenOutput = [0]
    
    
    
    var funcSelecc : Funciones!
    var indexSaltos : [Int] = []
    var indexSaltosAux : [Int] = []
    var lbMain : String!
    var lbFuncsAux : String!
    var lbFuncVal1 : String!
    var lbFuncVal2 : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xmain = Int(lbVariable1.frame.origin.x)
        xfun = Int(lbVariable2.frame.origin.x)
        ymain = Int(lbVariable1.frame.origin.y) + offsetmain
        yfun = Int(lbVariable2.frame.origin.y) + offsetfun
        
        llamadamainy = ymain + (20 * numlineasFunc1)
        
        indexSaltosAux = indexSaltos
        //print(xmain)
        //print(ymain)
        
        
        if numAbajo == 0{
            lbshadow.isHidden = true
            lbshadow.frame.origin.x = CGFloat(xmain)
            lbshadow.frame.origin.y = CGFloat(llamadamainy)
            numlineastotales = numlineasFunc1 + numlineasFunc2
            
        }
        
        lbTituloFunc.text = funcSelecc.tituloFunc
        
        lbVariable1.text = lbMain
        lbVariable2.text = lbFuncsAux
        
        tfVariable1_Func2.isHidden = true
        tfVariable2_Func2.isHidden = true
        tfVariable3_Func2.isHidden = true
        tfVariable4_Func2.isHidden = true
        tfVariable5_Func2.isHidden = true
        tfVariable6_Func2.isHidden = true
        
        view.backgroundColor = codeColor1
        fondo.backgroundColor = codeColor2
        barraMedio.backgroundColor = codeColor3
        flechaIzq.tintColor = codeColor4
        flechaDer.tintColor = codeColor4
        reset.tintColor = codeColor4
        consola.backgroundColor = codeColor5
        lbshadow.backgroundColor = codeColor4
        
    }
    
    func reinicia(){
        numAbajo = 0
        saltosCodigo = [-1]
        lenOutput = [0]
        indexSaltos = indexSaltosAux
        lbCodigo.text = ""
        lbshadow.isHidden = true
        lbshadow.frame.origin.x = CGFloat(xmain)
        lbshadow.frame.origin.y = CGFloat(llamadamainy)
        cteVar1 = auxCte1
        cteVar2 = auxCte2
        cteVar3 = auxCte3
        tfVariable1_Func2.isUserInteractionEnabled = true
        tfVariable2_Func2.isUserInteractionEnabled = true
        tfVariable3_Func2.isUserInteractionEnabled = true
        tfVariable4_Func2.isUserInteractionEnabled = true
        tfVariable5_Func2.isUserInteractionEnabled = true
        tfVariable6_Func2.isUserInteractionEnabled = true
        tfVariable1_Func2.backgroundColor = UIColor(named: "white")
        tfVariable2_Func2.backgroundColor = UIColor(named: "white")
        tfVariable3_Func2.backgroundColor = UIColor(named: "white")
        tfVariable4_Func2.backgroundColor = UIColor(named: "white")
        tfVariable5_Func2.backgroundColor = UIColor(named: "white")
        tfVariable6_Func2.backgroundColor = UIColor(named: "white")
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        reinicia()
    }
    
    @IBAction func cambiaModo(_ sender: UISegmentedControl) {
        
        tfVariable1_Func2.isHidden = !tfVariable1_Func2.isHidden
        tfVariable2_Func2.isHidden = !tfVariable2_Func2.isHidden
        tfVariable3_Func2.isHidden = !tfVariable3_Func2.isHidden
        if funcSelecc.tituloFunc == "Funcion 2"{
            
            tfVariable4_Func2.isHidden = !tfVariable4_Func2.isHidden
            tfVariable5_Func2.isHidden = !tfVariable5_Func2.isHidden
            tfVariable6_Func2.isHidden = !tfVariable6_Func2.isHidden
        }
        reinicia()
    }
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
    
    func mostrarEnPantalla(linea : Int){
        
        var string = lbCodigo.text!
        let estado = control.selectedSegmentIndex
        if estado == 1{
            asigna()
        }
        if funcSelecc.tituloFunc == "Funcion 1"{
            switch linea - 1{
            case 1:
                string.append("Iniciando simulacion ....\nValor_1 = ")
                string.append(cteVar1)
                print("Esta linea mide ", string.count)
                break
                
            case 2:
                string.append("\nValor_2 = ")
                string.append(cteVar2)
                print("Esta linea mide ", string.count)
                break
            
            case 3:
                string.append("\nValor_3 = ")
                string.append(cteVar3)
                print("Esta linea mide ", string.count)
                break
            case 4:
                string.append("\nSe llama calcular con los parametros ")
                string.append(cteVar1)
                string.append(" , ")
                string.append(cteVar2)
                string.append(" , ")
                string.append(cteVar3)
                break
            case 5:
                string.append("\nEntra calcular con los parametros ")
                string.append(cteVar1)
                string.append(" , ")
                string.append(cteVar2)
                string.append(" , ")
                string.append(cteVar3)
                break
            
            case 6:
                string.append("\nSe regresa a la funcion anterior con valor de retorno igual a ")
                string.append(String(Float(cteVar1)! + Float(cteVar2)! + Float(cteVar3)!))
                break
                
            case 7:
                string.append("\nValor_4 = ")
                string.append(String(Float(cteVar1)! + Float(cteVar2)! + Float(cteVar3)!))
                break
                
            case 8:
                string.append("\nSe suman los valores --> ")
                string.append(cteVar1)
                string.append(" ")
                string.append(cteVar2)
                string.append(" ")
                string.append(cteVar3)
                break
                
            case 9:
                string.append("\nLa suma es igual --> ")
                string.append(String(Float(cteVar1)! + Float(cteVar2)! + Float(cteVar3)!))
                break
                
            default:
                string.append("\nespero funcione")
            }
            lenOutput.append(string.count)
            print(lenOutput)
        } else {
            
        }
        
        lbCodigo.text = string
        
    }
    
    func hayDatos() -> Bool{
        if(!tfVariable1_Func2.isHidden){
            if(tfVariable1_Func2.text == "" ||  tfVariable2_Func2.text == "" || tfVariable3_Func2.text == ""){
                return false
            }
        }
        if(!tfVariable4_Func2.isHidden){
            if(tfVariable4_Func2.text == "" ||  tfVariable5_Func2.text == "" || tfVariable6_Func2.text == ""){
                return false
            }
        }
        return true
    }
 
    
    func asigna(){
        cteVar1 = tfVariable1_Func2.text!
        cteVar2 = tfVariable2_Func2.text!
        cteVar3 = tfVariable3_Func2.text!
        
    }
    
    
    @IBAction func siguienteLinea(_ sender: Any) {
        
        if numAbajo == 0 && hayDatos(){
            lbshadow.isHidden = false
        }

        let estado = control.selectedSegmentIndex
        if (estado == 1 && hayDatos()) || estado == 0{
            if(numAbajo < numlineastotales){
                
                if(numAbajo != 0){
                    if(numAbajo == 1){
                        lbshadow.frame.origin.y = CGFloat(ymain)
                    }
                    numAbajo = numAbajo + 1
                    
                    mostrarEnPantalla(linea: numAbajo)
                    print(numAbajo)
                    
                    lbshadow.frame = CGRect(x: lbshadow.frame.minX, y: lbshadow.frame.minY, width: CGFloat(funcSelecc.largos[numAbajo]), height: lbshadow.frame.height)
                    //print(lbshadow.frame)
                    // >= funcSelecc.llamadoFuncs[0]
                    if main {
                        if(numAbajo >= indexSaltos[0]){
                            saltosCodigo.insert( indexSaltos.removeFirst(), at: 0)
                            main = false
                            tempymain = lbshadow.frame.origin.y
                            lbshadow.frame.origin.y = CGFloat(yfun)
                            //print("ya se movio la sombra, tempymain = ", tempymain)
                        } else {
                            UIView.animate(withDuration: 1){
                                self.lbshadow.frame.origin.y += 20
                                //print(self.lbshadow.frame.origin.y)
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
                                //print(self.lbshadow.frame.origin.y)
                            }
                        }
                    }
                }
                else {
                    lbshadow.isHidden = false
                    numAbajo = numAbajo + 1
                    if estado == 1{
                        tfVariable1_Func2.isUserInteractionEnabled = false
                        tfVariable1_Func2.backgroundColor = codeColor4
                        tfVariable2_Func2.isUserInteractionEnabled = false
                        tfVariable2_Func2.backgroundColor = codeColor4
                        tfVariable3_Func2.isUserInteractionEnabled = false
                        tfVariable3_Func2.backgroundColor = codeColor4
                        tfVariable4_Func2.isUserInteractionEnabled = false
                        tfVariable4_Func2.backgroundColor = codeColor4
                        tfVariable5_Func2.isUserInteractionEnabled = false
                        tfVariable5_Func2.backgroundColor = codeColor4
                        tfVariable6_Func2.isUserInteractionEnabled = false
                        tfVariable5_Func2.backgroundColor = codeColor4
                    }
                }
            } else {
                //Esta no la quise borrar porque en la funcion reinicia le puse otro valor, esta bien?
                //lbshadow.frame.origin.y = CGFloat(ymain + llamadamainy)
                reinicia()
            }
        }
    }
    
    
    
    @IBAction func lineaAtras(_ sender: Any) {
        
        let estado = control.selectedSegmentIndex
        
        if numAbajo > 0 {
            numAbajo = numAbajo - 1
            
            print(numAbajo)
            lbshadow.frame = CGRect(x: lbshadow.frame.minX, y: lbshadow.frame.minY, width: CGFloat(funcSelecc.largos[numAbajo]), height: lbshadow.frame.height)
            
            if numAbajo == 0{
                lbshadow.isHidden = true
                lbshadow.frame.origin.y = CGFloat(ymain + llamadamainy)
                lbCodigo.text = ""
                indexSaltos = indexSaltosAux
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
            if lenOutput.count > 1{
                var aux = lbCodigo.text!
                print(aux)
                print(lenOutput, " / ",  lenOutput[lenOutput.count - 2]+1, lenOutput[lenOutput.count - 1])
                for _ in lenOutput[lenOutput.count - 2]+1 ... lenOutput[lenOutput.count - 1]{
                    aux.removeLast()
                }
                lenOutput.popLast()
                lbCodigo.text = aux
            }
        }
        else{
            if(!tfVariable1_Func2.isUserInteractionEnabled){
                
                tfVariable1_Func2.isUserInteractionEnabled = true
                tfVariable1_Func2.backgroundColor = UIColor(named: "white")
                tfVariable2_Func2.isUserInteractionEnabled = true
                tfVariable2_Func2.backgroundColor = UIColor(named: "white")
                tfVariable3_Func2.isUserInteractionEnabled = true
                tfVariable3_Func2.backgroundColor = UIColor(named: "white")
                tfVariable4_Func2.isUserInteractionEnabled = true
                tfVariable4_Func2.backgroundColor = UIColor(named: "white")
                tfVariable5_Func2.isUserInteractionEnabled = true
                tfVariable5_Func2.backgroundColor = UIColor(named: "white")
                tfVariable6_Func2.isUserInteractionEnabled = true
                tfVariable5_Func2.backgroundColor = UIColor(named: "white")
            }
        }
    }
    
    
    @IBAction func unwindGlosarioFuncion(segue: UIStoryboardSegue){
        
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarGlosarioFuncion"{
        let vista = segue.destination as! ViewControllerGlosario
            
        vista.glosColor1 = codeColor1
        vista.glosColor2 = codeColor2
            print(codeColor1, codeColor2)
        }
            
    }
}
