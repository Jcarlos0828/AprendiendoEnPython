//
//  VisualCodeViewController.swift
//  Prototipo1
//
//  Created by user190015 on 4/17/21.
//
//  Proyecto final desarrollado por:
//    - Jose Carlos del Castillo Estrada | A00822554
//    - Adolfo Benjamin Lerma Villalobos | A00822029
//

import UIKit

class VisualCodeViewController: UIViewController {

    @IBOutlet weak var lbTituloFunc: UILabel!
    
    //Variables que miden cuantas lineas de texto hay, para saber cuando saltar
    var numlineasFunc1 = 0
    var numlineasFunc2 = 0
    var numlineastotales = 0
    
    //Variables usadas para llevar el control de a donde saltar para cuando avanza y retrocede la funcion
    var indexSaltos : [Int] = []
    var saltosCodigo = [-1]
    var indexSaltosAux : [Int] = []
    
    //Variables del shadow que indica el "cursor" de linea actual
    @IBOutlet weak var lbshadow: UILabel!
    var xmain = 0
    var xfun = 0
    var ymain = 0
    var yfun = 0
    var numAbajo = 0
    var tempymain = CGFloat()
    var main = true
    var offsetmain = 0
    var offsetfun = 0
    var llamadamainy = 0
    
    //Variables de los colores presentes que son paleta de color (por default rojo pero nunca se deberia ver)
    var codeColor1 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    var codeColor2 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    var codeColor3 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    var codeColor4 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    var codeColor5 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    
    //Y gris que es el bloqueo de celda en modo practica
    var codeColor6 = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    
    //Objetos presente en pantalla
    @IBOutlet weak var fondo: UIView!
    @IBOutlet weak var consola: UIView!
    @IBOutlet weak var barraMedio: UIView!
    @IBOutlet weak var flechaIzq: UIButton!
    @IBOutlet weak var flechaDer: UIButton!
    @IBOutlet weak var reset: UIButton!
    
    //Espacios para mostrar el texto que representa el codigo de la funcion
    @IBOutlet weak var lbVariable1: UILabel!
    @IBOutlet weak var lbVariable2: UILabel!
    var lbMain : String!
    var lbFuncsAux : String!
    
    //Variables de text fields para modo practica y sus auxiliares para cambio de datos
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
    
    //Variables de manejo de output en el espacio de la consola
    @IBOutlet weak var lbCodigo: UILabel!
    var lenOutput = [0] //Guarda la longitud total del output en cada iteracion
    var repintar = [[0,0]] //El valor de la izq. indica index de texto donde empieza la linea, el de la der. indica la longitud del texto a pintar
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
    
    //Switch para el cambio de modo
    @IBOutlet weak var control: UISegmentedControl!
    
    //Variable que recibe propiedades de las funciones
    var funcSelecc : Funciones!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Establecer espacio para que aparezca el cursor
        xmain = Int(lbVariable1.frame.origin.x)
        xfun = Int(lbVariable2.frame.origin.x)
        ymain = Int(lbVariable1.frame.origin.y) + offsetmain
        yfun = Int(lbVariable2.frame.origin.y) + offsetfun
        
        llamadamainy = ymain + (20 * numlineasFunc1)
        
        //Guardar registro de donde se hacen los saltos para cuando se llame reinicia()
        indexSaltosAux = indexSaltos
        
        
        //Establecer posiciones para mover el cursor
        if numAbajo == 0{
            lbshadow.isHidden = true
            lbshadow.frame.origin.x = CGFloat(xmain)
            lbshadow.frame.origin.y = CGFloat(llamadamainy)
            numlineastotales = numlineasFunc1 + numlineasFunc2
        }
        
        //Estabelcer las constantes del modo "simulacion" para funcion 1 o 2
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
            }
        }
        
        //Escribir texto estatico en pantalla
        lbTituloFunc.text = funcSelecc.tituloFunc
        lbVariable1.text = lbMain
        lbVariable2.text = lbFuncsAux
        
        //Ocultar text fields del modo practica porque se empieza en modo simulacion
        tfVariable1_Func2.isHidden = true
        tfVariable2_Func2.isHidden = true
        tfVariable3_Func2.isHidden = true
        tfVariable4_Func2.isHidden = true
        tfVariable5_Func2.isHidden = true
        tfVariable6_Func2.isHidden = true
        
        //Ponerle color de la paleta recibida a los objetos en pantalla
        view.backgroundColor = codeColor1
        fondo.backgroundColor = codeColor2
        barraMedio.backgroundColor = codeColor3
        flechaIzq.tintColor = codeColor4
        flechaDer.tintColor = codeColor4
        reset.tintColor = codeColor4
        consola.backgroundColor = codeColor5
        lbshadow.backgroundColor = codeColor4
        
    }
    
    //Establecer todas las variables que cambien a sus valores originales
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
    
    //Boton del centro
    @IBAction func reset(_ sender: UIButton) {
        reinicia()
    }
    
    //Funcion del segmented controller para cambio de modos
    @IBAction func cambiaModo(_ sender: UISegmentedControl) {
        
        //Habilitar text fields dependiendo del modo
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
    
    //Funcion invocada cada vez que se presiona el boton de "avanzar" para obtener el output
    func mostrarEnPantalla(linea : Int){
        
        //Variables para registrar texto de output
        var tam = 0
        var string = lbCodigo.text!
        let estado = control.selectedSegmentIndex
        
        //Variable que le cambia el texto a color verde para indicar "prints"
        let string4 = NSAttributedString()
        
        //Activar text fields si estamos en modo practica
        if estado == 1{
            asigna()
        }
        if funcSelecc.tituloFunc == "Funcion 1"{
            
            //Caad caso hace match con la linea en la que estamos
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
                    string.append(", Dato_2 = ")
                    string.append(cteVar1)
                    string.append(", Dato_3 = ")
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
                    string.append(", valor_2 = ")
                    string.append(String(Float(cteVar2)! +  ( Float(cteVar4)! / Float(cteVar5)!) ) )
                    string.append(", valor_3 = ")
                    string.append(cteVar2)
                    break
                    
                case 11:
                    tam = string.count
                    string.append("\nValor_1 es = ")
                    string.append(String(Float(cteVar1)! * Float(cteVar6)!))
                    string.append(", Valor_2 es = ")
                    string.append(String(Float(cteVar2)! +  ( Float(cteVar4)! / Float(cteVar5)!) ) )
                    string.append(", Valor_3 es = ")
                    string.append(cteVar2)
                    
                    repintar.append([tam,string.count - tam])
                    break
                    
                case 12:
                    tam = string.count
                    string.append("\nLa suma de los valores es igual a = ")
                    let aux = (Float(cteVar1)! * Float(cteVar6)!)
                    let aux2 = aux + (Float(cteVar2)! +  ( Float(cteVar4)! / Float(cteVar5)!))
                    let aux3 = aux2 + Float(cteVar2)!
                    string.append(String(aux3))
                    
                    repintar.append([tam,string.count - tam])
                    break
                    
                default:
                    string.append("\nespero funcione")
                }
                
                lenOutput.append(string.count)
            }
        }
        
        //Preparar el string que ya tiene el output mas reciente para mutarlo de ser necesario
        let combination = NSMutableAttributedString(string: string)
        combination.append(string4)
        
        //repintar lleva la cuenta de cuantas lineas son de "prints" (color verde)
        if repintar.count > 1{
            for i in 0..<(repintar.count){
                //Ignorar el primer arreglo que es [0,0], ya que solo es un default
                if repintar[i][0] != 0{
                    //Indica el rango que se va a pintar
                    combination.addAttributes(attributes, range: NSRange(location: repintar[i][0], length: repintar[i][1]))
                    lbCodigo.attributedText = combination
                }
            }
        }
        //Si solo hay un arreglo en repintar, no hay lineas de "prints" aun, se pone blanco por default
        else{
            lbCodigo.attributedText = combination
        }
            
    }
    
    //Funcion que bloquea "avanzar" si no hay texto al regresar falso
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
 
    //Funcion que guarda el valor escrito en el text field para ser calculado
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
            }
        }
    }
    
    //Funcion que se activa con el boton de avanzar
    @IBAction func siguienteLinea(_ sender: Any) {
        
        if numAbajo == 0{
            lbshadow.isHidden = false
        }
        if hayDatos(){
            lbshadow.isHidden = false
        }

        let estado = control.selectedSegmentIndex
        //Checa el modo en el que estamos para hacer activaciones de text fields
        if (estado == 1 && hayDatos()) || estado == 0{
            //Solo avanzar si hay mas output por mostrar
            if(numAbajo < numlineastotales){
                
                //Si es el primer output se reposiciona el cursor para empezar a mostrar
                if(numAbajo != 0){
                    if(numAbajo == 1){
                        lbshadow.frame.origin.y = CGFloat(ymain)
                    }
                    numAbajo = numAbajo + 1
                    
                    mostrarEnPantalla(linea: numAbajo)
                    
                    lbshadow.frame = CGRect(x: lbshadow.frame.minX, y: lbshadow.frame.minY, width: CGFloat(funcSelecc.largos[numAbajo]), height: lbshadow.frame.height)
                    
                    //Section used to know if the cursor is in the main function or the auxiliar one
                    if main {
                        
                        //Identificar si vamos a salir de la funcion main
                        if(numAbajo >= indexSaltos[0]){
                            saltosCodigo.insert( indexSaltos.removeFirst(), at: 0)
                            main = false
                            tempymain = lbshadow.frame.origin.y
                            lbshadow.frame.origin.y = CGFloat(yfun)
                        } else {
                            UIView.animate(withDuration: 1){
                                self.lbshadow.frame.origin.y += 20
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
            }
            else {
                reinicia()
            }
        }
    }
    
    //Funcion invocada cada vez que se presiona el boton de "atras" para obtener el output
    @IBAction func lineaAtras(_ sender: Any) {
        if numAbajo > 0 {
            numAbajo = numAbajo - 1
            //Obtener el ancho de la linea a la que vamos a retroceder
            lbshadow.frame = CGRect(x: lbshadow.frame.minX, y: lbshadow.frame.minY, width: CGFloat(funcSelecc.largos[numAbajo]), height: lbshadow.frame.height)
            
            if numAbajo == 0{
                reinicia()
            } else {
                //Borrar los saltos avanzados
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
                    //Borrar los saltos avanzados
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
            //Checa si hay lineas para borrar
            if lenOutput.count > 1{
                var aux = lbCodigo.text!
                
                //Identificar el largo del string que vamos a borrar
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
                //Vamos a borrar linea blanca pero tambien hay verdes
                else{
                    for i in 0..<(repintar.count){
                        if repintar[i][0] != 0{
                            combination.addAttributes(attributes, range: NSRange(location: repintar[i][0], length: repintar[i][1]))
                            lbCodigo.attributedText = combination
                        }
                    }
                }
                }
                //Pintar puras lineas blancas
                else{
                   lbCodigo.attributedText = combination
                }
                lenOutput.popLast()
            }
        }
        else{
            if(!tfVariable1_Func2.isUserInteractionEnabled){
                reinicia()
            }
        }
    }

    
    // MARK: - Navigation
    
    //Marcar el color para el glosario
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarGlosarioFuncion"{
        let vista = segue.destination as! ViewControllerGlosarioFunciones
            
        vista.glosColor1 = codeColor1
        vista.glosColor2 = codeColor2
            print(codeColor1, codeColor2)
        }
    }
    
    @IBAction func unwindGlosarioFuncion(segue: UIStoryboardSegue){
        
    }
}
