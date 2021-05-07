//
//  ViewController.swift
//  Prototipo1
//
//  Created by user189317 on 4/16/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var listaFunciones = [
        Funciones(tituloFunc: "Funcion 1"),
        Funciones(tituloFunc: "Funcion 2")
    ]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var lbFunc1Var1 = """
                      def calcular(dato_1, dato_2, dato_3):
                          return dato_1 + dato_2 + dato_3
                      """
    var lbFunc1Var2 = """
                      def main():
                          valor_1 = 10
                          valor_2 = 15
                          valor_3 = 20
                          valor_4 = calcular(valor_1,_valor_2,valor_3)
                          print("Se suman los valores -->", valor_1, valor_2, valor_3)
                          print("La suma es igual -> ", valor_4)
                      """
    var lbFunc1Val1 = "10"
    var lbFunc1Val2 = "15"
    
    var lbFunc2Var1 = "valor_1"
    var lbFunc2Var2 = "valor_2"
    var lbFunc2Val1 = "18"
    var lbFunc2Val2 = "22"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        return 160
    }
    
    
    
    // MARK: - Metodos de Segue
    

    @IBAction func unwwindFuncion(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindGlosario(segue: UIStoryboardSegue){
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "muestraCodigo"{
            let vistaCodigo = segue.destination as! VisualCodeViewController
            
            let indice = tableView.indexPathForSelectedRow!
            
            if listaFunciones[indice.row].tituloFunc == "Funcion 1"{
                let main = lbFunc1Var2
                let funcion = lbFunc1Var1
                vistaCodigo.lbFuncVar1 = main
                vistaCodigo.lbFuncVar2 = funcion
                //vistaCodigo.lbFuncVal1 = "10"
                //vistaCodigo.lbFuncVal2 = "15"
            }
            
            else if listaFunciones[indice.row].tituloFunc == "Funcion 2"{
                vistaCodigo.lbFuncVar1 = "valor_1"
                vistaCodigo.lbFuncVar2 = "valor_2"
                vistaCodigo.lbFuncVal1 = "18"
                vistaCodigo.lbFuncVal2 = "22"
            }
            vistaCodigo.funcSelecc = listaFunciones[indice.row]
        }
    }


}

