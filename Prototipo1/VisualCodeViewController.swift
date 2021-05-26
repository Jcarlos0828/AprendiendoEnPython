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
    var codeColor6 = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    @IBOutlet weak var fondo: UIView!
    @IBOutlet weak var consola: UIView!
    @IBOutlet weak var barraMedio: UIView!
    @IBOutlet weak var flechaIzq: UIButton!
    @IBOutlet weak var flechaDer: UIButton!
    @IBOutlet weak var reset: UIButton!
    
    
    @IBOutlet weak var lbVariable1: UILabel!
    @IBOutlet weak var lbVariable2: UILabel!
    
    
    
    
    @IBOutlet weak var tfVariable1_Func2: UITextField!
    var cteVar1 = "0"
    var auxCte1 = "0"
    @IBOutlet weak var tfVariable2_Func2: UITextField!
    var cteVar2 = "0"
    var auxCte2 = "0"
    @IBOutlet weak var tfVariable3_Func2: UITextField!
    var cteVar3 = "0"
    var auxCte3 = "0"
    @IBOutlet weak var tfVariable4_Func2: UITextField!
    var cteVar4 = "0"
    var auxCte4 = "0"
    @IBOutlet weak var tfVariable5_Func2: UITextField!
    var cteVar5 = "0"
    var auxCte5 = "0"
    @IBOutlet weak var tfVariable6_Func2: UITextField!
    var cteVar6 = "0"
    var auxCte6 = "0"
    @IBOutlet weak var control: UISegmentedControl!
    @IBOutlet weak var lbCodigo: UILabel!
    var lenOutput = [0]
    var repintar = [[0,0]]
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.green ]
    
    
    
    var funcSelecc : Funciones!
    var indexSaltos : [Int] = []
    var indexSaltosAux : [Int] = []
    var lbMain : String!
    var lbFuncsAux : String!
    var lbFuncVal1 : String!
    var lbFuncVal2 : String!
    var output = false
    
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
        
        if funcSelecc.tituloFunc == "Funcion 1"{
            cteVar1 = "10"
            cteVar2 = "15"
            cteVar3 = "20"
            auxCte1 = "10"
            auxCte2 = "15"
            auxCte3 = "20"
        } else {
            if funcSelecc.tituloFunc == "Funcion 2"{
                cteVar1 = "12"
                cteVar2 = "3"
                cteVar3 = "9"
                cteVar4 = "36"
                cteVar5 = "6"
                cteVar6 = "2"
                auxCte1 = "12"
                auxCte2 = "3"
                auxCte3 = "9"
                auxCte4 = "36"
                auxCte5 = "6"
                auxCte6 = "2"
            } else {
                //Funcion 3
            }
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
        main = true
        lbCodigo.text = ""
        lbshadow.isHidden = true
        lbshadow.frame.origin.x = CGFloat(xmain)
        lbshadow.frame.origin.y = CGFloat(llamadamainy)
        cteVar1 = auxCte1
        cteVar2 = auxCte2
        cteVar3 = auxCte3
        cteVar4 = auxCte4
        cteVar5 = auxCte5
        cteVar6 = auxCte6
        tfVariable1_Func2.isUserInteractionEnabled = true
        tfVariable2_Func2.isUserInteractionEnabled = true
        tfVariable3_Func2.isUserInteractionEnabled = true
        tfVariable4_Func2.isUserInteractionEnabled = true
        tfVariable5_Func2.isUserInteractionEnabled = true
        tfVariable6_Func2.isUserInteractionEnabled = true
        tfVariable1_Func2.backgroundColor = UIColor(red:1 , green: 1, blue: 1, alpha: 1)
        tfVariable2_Func2.backgroundColor = UIColor(red:1 , green: 1, blue: 1, alpha: 1)
        tfVariable3_Func2.backgroundColor = UIColor(red:1 , green: 1, blue: 1, alpha: 1)
        tfVariable4_Func2.backgroundColor = UIColor(red:1 , green: 1, blue: 1, alpha: 1)
        tfVariable5_Func2.backgroundColor = UIColor(red:1 , green: 1, blue: 1, alpha: 1)
        tfVariable6_Func2.backgroundColor = UIColor(red:1 , green: 1, blue: 1, alpha: 1)
        repintar = [[0,0]]
        
        
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
        
        var tam = 0
        
        var string = lbCodigo.text!
        let estado = control.selectedSegmentIndex
        var string4 = NSAttributedString()
        if estado == 1{
            asigna()
        }
        if funcSelecc.tituloFunc == "Funcion 1"{
            switch linea - 1{
            case 1:
                tam = 0
                string.append("Iniciando simulacion ....\nValor_1 = ")
                string.append(cteVar1)
                print("Esta linea mide ", string.count)
                break
                
            case 2:
                tam = string.count
                string.append("\nValor_2 = ")
                string.append(cteVar2)
                print("Esta linea mide ", string.count)
                break
            
            case 3:
                tam = string.count
                string.append("\nValor_3 = ")
                string.append(cteVar3)
                print("Esta linea mide ", string.count)
                break
            case 4:
                tam = string.count
                string.append("\nSe llama calcular con los parametros Valor_1: ")
                string.append(cteVar1)
                string.append(" ,Valor_2: ")
                string.append(cteVar2)
                string.append(" ,Valor_3: ")
                string.append(cteVar3)
                break
            case 5:
                tam = string.count
                string.append("\nEntra a calcular con los parametros dato_1: ")
                string.append(cteVar1)
                string.append(" ,dato_2: ")
                string.append(cteVar2)
                string.append(" ,dato_3: ")
                string.append(cteVar3)
                break
            
            case 6:
                tam = string.count
                string.append("\nSe regresa a la funcion anterior con valor de retorno igual a ")
                string.append(String(Float(cteVar1)! + Float(cteVar2)! + Float(cteVar3)!))
                break
                
            case 7:
                tam = string.count
                string.append("\nValor_4 = ")
                string.append(String(Float(cteVar1)! + Float(cteVar2)! + Float(cteVar3)!))
                break
                
            case 8:
                
                tam = string.count
                string.append("\nSe suman los valores --> ")
                string.append(cteVar1)
                string.append(" ")
                string.append(cteVar2)
                string.append(" ")
                string.append(cteVar3)
                repintar.append([tam,string.count - tam])
                
                break
                
            case 9:
                
                tam = string.count
                string.append("\nLa suma es igual --> ")
                string.append(String(Float(cteVar1)! + Float(cteVar2)! + Float(cteVar3)!))
                
                repintar.append([tam,string.count - tam])
                
                break
                
            default:
                string.append("\nespero funcione")
            }
            lenOutput.append(string.count)
            print(lenOutput)
        } else {
            //funcion 2
            if funcSelecc.tituloFunc == "Funcion 2"{
                switch linea - 1{
                case 1:
                    tam = 0
                    string.append("Iniciando simulacion ....\nValor_1 = ")
                    string.append(cteVar1)
                    print("Esta linea mide ", string.count)
                    break
                    
                case 2:
                    tam = string.count
                    string.append("\nValor_2 = ")
                    string.append(cteVar2)
                    print("Esta linea mide ", string.count)
                    break
                
                case 3:
                    tam = string.count
                    string.append("\nValor_3 = ")
                    string.append(cteVar3)
                    print("Esta linea mide ", string.count)
                    break
                case 4:
                    tam = string.count
                    string.append("\nSe llama recalcula con los parametros valor_2 = ")
                    string.append(cteVar2)
                    string.append(" ,valor_3 = ")
                    string.append(cteVar3)
                    string.append(" ,valor_1 = ")
                    string.append(cteVar1)
                    break
                case 5:
                    tam = string.count
                    string.append("\nEntra a recalcula con los parametros dato_3 = ")
                    string.append(cteVar2)
                    string.append(" ,dato_1 = ")
                    string.append(cteVar3)
                    string.append(" ,dato_2 = ")
                    string.append(cteVar1)
                    break
                
                case 6:
                    tam = string.count
                    string.append("\nDato_1 =  ")
                    string.append(cteVar3)
                    string.append(" ,Dato_2 = ")
                    string.append(cteVar1)
                    string.append(" ,Dato_3 = ")
                    string.append(cteVar2)
                    
                    repintar.append([tam,string.count - tam])
                    break
                    
                case 7:
                    tam = string.count
                    string.append("\ndato_2 = ")
                    string.append(String(Float(cteVar2)! +  ( Float(cteVar4)! / Float(cteVar5)!) ) )
                    break
                    
                case 8:
                    tam = string.count
                    output = false
                    string.append("\ndato_1 = ")
                    string.append(String(Float(cteVar1)! * Float(cteVar6)!))
                    break
                    
                case 9:
                    tam = string.count
                    string.append("\nSe regresa a la funcion anterior con valor de: dato_1 = ")
                    string.append(String(Float(cteVar1)! * Float(cteVar6)!))
                    string.append(" ,dato_2 = ")
                    string.append(String(Float(cteVar2)! +  ( Float(cteVar4)! / Float(cteVar5)!) ) )
                    string.append(" ,dato_3 = ")
                    string.append(cteVar2)
                    break
                    
                case 10:
                    tam = string.count
                    string.append("\nvalor_1 = ")
                    string.append(String(Float(cteVar1)! * Float(cteVar6)!))
                    string.append(" ,valor_2 = ")
                    string.append(String(Float(cteVar2)! +  ( Float(cteVar4)! / Float(cteVar5)!) ) )
                    string.append(" ,valor_3 = ")
                    string.append(cteVar2)
                    break
                    
                case 11:
                    tam = string.count
                    string.append("\nValor_1 es = ")
                    string.append(String(Float(cteVar1)! * Float(cteVar6)!))
                    string.append(" Valor_2 es = ")
                    string.append(String(Float(cteVar2)! +  ( Float(cteVar4)! / Float(cteVar5)!) ) )
                    string.append(" Valor_3 es = ")
                    string.append(cteVar2)
                    
                    repintar.append([tam,string.count - tam])
                    break
                    
                case 12:
                    tam = string.count
                    string.append("\nDato3 es = ")
                    string.append(cteVar2)
                    
                    repintar.append([tam,string.count - tam])
                    break
                    
                default:
                    string.append("\nespero funcione")
                }
                lenOutput.append(string.count)
                print(lenOutput)
            } else {
                //Funcion 3
            }
            
        }
        
        let combination = NSMutableAttributedString(string: string)
        
        combination.append(string4)
        var start = lenOutput.last!
        
            if repintar.count > 1{
                for i in 0..<(repintar.count){
                    if repintar[i][0] != 0{
                        combination.addAttributes(attributes, range: NSRange(location: repintar[i][0], length: repintar[i][1]))
                        lbCodigo.attributedText = combination
                    }
                }
            }
            else{
               lbCodigo.attributedText = combination
            }
            
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
        
        if funcSelecc.tituloFunc == "Funcion 1"{
            cteVar1 = tfVariable1_Func2.text!
            cteVar2 = tfVariable2_Func2.text!
            cteVar3 = tfVariable3_Func2.text!
        } else {
            if funcSelecc.tituloFunc == "Funcion 2"{
                cteVar1 = tfVariable1_Func2.text!
                cteVar2 = tfVariable2_Func2.text!
                cteVar3 = tfVariable3_Func2.text!
                cteVar4 = tfVariable4_Func2.text!
                cteVar5 = tfVariable5_Func2.text!
                cteVar6 = tfVariable6_Func2.text!
            } else {
                //Funcion 3
            }
        }
    }
    
    
    @IBAction func siguienteLinea(_ sender: Any) {
        
        if numAbajo == 0{
            lbshadow.isHidden = false
        }
        if hayDatos(){
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
                        tfVariable1_Func2.backgroundColor = codeColor6
                        tfVariable2_Func2.isUserInteractionEnabled = false
                        tfVariable2_Func2.backgroundColor = codeColor6
                        tfVariable3_Func2.isUserInteractionEnabled = false
                        tfVariable3_Func2.backgroundColor = codeColor6
                        tfVariable4_Func2.isUserInteractionEnabled = false
                        tfVariable4_Func2.backgroundColor = codeColor6
                        tfVariable5_Func2.isUserInteractionEnabled = false
                        tfVariable5_Func2.backgroundColor = codeColor6
                        tfVariable6_Func2.isUserInteractionEnabled = false
                        tfVariable6_Func2.backgroundColor = codeColor6
                        
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
                reinicia()
                /*
                lbshadow.isHidden = true
                lbshadow.frame.origin.y = CGFloat(ymain + llamadamainy)
                lbCodigo.text = ""
                indexSaltos = indexSaltosAux*/
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
                
                for _ in lenOutput[lenOutput.count - 2]+1 ... lenOutput[lenOutput.count - 1]{
                    aux.removeLast()
                }
                let combination = NSMutableAttributedString(string: aux)
                if repintar.count > 1{
                //Aqui se entra cuando la linea a borrar sea verde
                if aux.count == repintar[repintar.count-1][0]{
                    repintar.popLast()
                    for i in 0..<(repintar.count){
                        if repintar[i][0] != 0{
                            combination.addAttributes(attributes, range: NSRange(location: repintar[i][0], length: repintar[i][1]))
                            lbCodigo.attributedText = combination
                        }
                        else{
                            lbCodigo.attributedText = combination
                        }
                    }
                }
                //Vamos a borrar linea blanca pero hay verdes
                else{
                    for i in 0..<(repintar.count){
                        if repintar[i][0] != 0{
                            combination.addAttributes(attributes, range: NSRange(location: repintar[i][0], length: repintar[i][1]))
                            lbCodigo.attributedText = combination
                        }
                    }
                }
                }
                else{
                   lbCodigo.attributedText = combination
                }
                lenOutput.popLast()
            }
        }
        else{
            if(!tfVariable1_Func2.isUserInteractionEnabled){
                /*
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
                 */
                reinicia()
            }
        }
    }
    
    
    @IBAction func unwindGlosarioFuncion(segue: UIStoryboardSegue){
        
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarGlosarioFuncion"{
        let vista = segue.destination as! ViewControllerGlosarioFunciones
            
        vista.glosColor1 = codeColor1
        vista.glosColor2 = codeColor2
            print(codeColor1, codeColor2)
        }
            
    }
}
