//
//  ViewController.swift
//  Prototipo1
//
//  Created by user189317 on 4/16/21.

//  Proyecto final desarrollado por:
//    - Jose Carlos del Castillo Estrada | A00822554
//    - Adolfo Benjamin Lerma Villalobos | A00822029
//

import UIKit

//Funcion que convierte RGB a un UIColor
func UIColorFromRGB(_ rgbValue: Int) -> UIColor! {
    return UIColor(
        red: CGFloat((Float((rgbValue & 0xff0000) >> 16)) / 255.0),
        green: CGFloat((Float((rgbValue & 0x00ff00) >> 8)) / 255.0),
        blue: CGFloat((Float((rgbValue & 0x0000ff) >> 0)) / 255.0),
        alpha: 1.0)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    //Propiedades de la funcion
    var listaFunciones = [
        Funciones(tituloFunc: "Funcion 1", llamadoFuncs : [6,8], largos : [60,140,130,130,130,350,280,265,350,480,300]),
        Funciones(tituloFunc: "Funcion 2", llamadoFuncs : [6,11], largos : [60,140,140,140,140,480,275,540,215,200,240,480,580,555])
    ]
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //Texto que se mostrara que indica el ejercicio que se va a realizar
    var lbFunc1Calcular = """
                      def calcular(dato_1, dato_2, dato_3):
                          return dato_1 + dato_2 + dato_3
                      """
    var lbFunc1Main = """
                      def main():
                          valor_1  = 10
                          valor_2 = 15
                          valor_3 = 20
                          valor_4 = calcular(valor_1,_valor_2,valor_3)
                          print("Se suman los valores -->", valor_1, valor_2, valor_3)
                          print("La suma es igual -> ", valor_4)

                      main()
                      """
    
    var lbFunc2Valores = """
                      def recalcula(dato_3,dato_1,dato_2):
                          print("Dato1 =", dato_1, " Dato2 =",dato_2, " Dato3 =", dato_3)
                          dato_2 = dato_3 + 36  / 6
                          dato_1 = dato_2 ** 2
                          return dato_1, dato_2, dato_3
                      """
    var lbFunc2Main = """
                      def main():
                          valor_1  = 12
                          valor_2 = 3
                          valor_3 = 9
                          valor_1, valor_2, valor_3 = recalcula(valor_2, valor_3, valor_1)
                          print("Valor1 es =", valor_1, " Valor2 es = ", valor_2, " Valor3 es =", valor_3)
                          print("La suma de los valores es igual a = ", valor_1+valor_2+valor_3)

                      main()
                      """
    //Establece los colores iniciales de todo el programa a la primera paleta por default
    var mainColor1 = UIColorFromRGB(0x99B998)
    var mainColor2 = UIColorFromRGB(0xFDCEAA)
    var mainColor3 = UIColorFromRGB(0xF4837D)
    var mainColor4 = UIColorFromRGB(0xEB4960)
    var mainColor5 = UIColorFromRGB(0x27363B)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.reloadData()
    }
    
    // MARK: - Metodos de Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaFunciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda")!
        cell.textLabel?.text = listaFunciones[indexPath.row].tituloFunc
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    
    
    // MARK: - Metodos de Segue
    //Mandamos informacion por medio de los segue
    
    @IBAction func unwwindFuncion(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindGlosario(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindColores(segue: UIStoryboardSegue){
        view.backgroundColor = mainColor1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "muestraCodigo"{
            let vistaCodigo = segue.destination as! VisualCodeViewController
            
            let indice = tableView.indexPathForSelectedRow!
            
            vistaCodigo.codeColor1 = mainColor1!
            vistaCodigo.codeColor2 = mainColor2!
            vistaCodigo.codeColor3 = mainColor3!
            vistaCodigo.codeColor4 = mainColor4!
            vistaCodigo.codeColor5 = mainColor5!
            
            if listaFunciones[indice.row].tituloFunc == "Funcion 1"{
                //Establecen el texto en pantalla
                let main = lbFunc1Main
                let funcion = lbFunc1Calcular
                vistaCodigo.lbMain = main
                vistaCodigo.lbFuncsAux = funcion
                
                //Variables para calcular los saltos de linea para el cursor
                vistaCodigo.numlineasFunc1 = 8
                vistaCodigo.numlineasFunc2 = 2
                vistaCodigo.indexSaltos = listaFunciones[indice.row].llamadoFuncs
                vistaCodigo.offsetmain = 26
                vistaCodigo.offsetfun = 78                
            }
            
            else if listaFunciones[indice.row].tituloFunc == "Funcion 2"{
                //Establecen el texto en pantalla
                let main = lbFunc2Main
                let funcion = lbFunc2Valores
                vistaCodigo.lbMain = main
                vistaCodigo.lbFuncsAux = funcion
                
                //Variables para calcular los saltos de linea para el cursor
                vistaCodigo.numlineasFunc1 = 8
                vistaCodigo.numlineasFunc2 = 5
                vistaCodigo.indexSaltos = listaFunciones[indice.row].llamadoFuncs
                vistaCodigo.offsetmain = 26
                vistaCodigo.offsetfun = 46
            }
            vistaCodigo.funcSelecc = listaFunciones[indice.row]
        }
        else if segue.identifier == "glosarioMenu"{
            let vista = segue.destination as! ViewControllerGlosario
            
            vista.glosColor1 = mainColor1!
            vista.glosColor2 = mainColor2!
            
        }
        else if segue.identifier == "colores"{
            let vista = segue.destination as! ViewControllerColores
            
            vista.tCol1 = mainColor1!
            vista.tCol2 = mainColor2!
            vista.tCol3 = mainColor3!
            vista.tCol4 = mainColor4!
            vista.tCol5 = mainColor5!
        }
        else if segue.identifier == "creditos"{
            let vista = segue.destination as! ViewControllerCreditos
        }
    }
}

