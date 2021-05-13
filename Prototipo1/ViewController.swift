//
//  ViewController.swift
//  Prototipo1
//
//  Created by user189317 on 4/16/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var listaFunciones = [
        Funciones(tituloFunc: "Funcion 1", llamadoFuncs : [5,7]),
        Funciones(tituloFunc: "Funcion 2", llamadoFuncs : [5,10])
    ]
    
    
    @IBOutlet weak var tableView: UITableView!

    var lbFunc1Calcular = """
                      def calcular(dato_1, dato_2, dato_3):
                          return dato_1 + dato_2 + dato_3
                      """
    var lbFunc1Main = """
                      def main():
                          valor_1 = 10
                          valor_2 = 15
                          valor_3 = 20
                          valor_4 = calcular(valor_1,_valor_2,valor_3)
                          print("Se suman los valores -->", valor_1, valor_2, valor_3)
                          print("La suma es igual -> ", valor_4)
                      """
    
    var lbFunc2Valores = """
                      def valores(dato_3,dato_1,dato_2):
                          print("dato_1 =", dato_1, " dato_2 =",dato_2, " dato_3 =", dato_3)
                          dato_2 = dato_3 + 36 / 6
                          dato_1 = dato_2 ** 2
                          return dato_1, dato_2, dato_3
                      """
    var lbFunc2Main = """
                      def main():
                          valor_1 = 12
                          valor_2 = 3
                          valor_3 = 9
                          valor_1, valor_2, valor_3 = valores(valor_2,valor_3,valor_1)
                          print("valor_1 =", valor_1, " valor_2 = ", valor_2, " valor_3 =", valor_3)
                          print("dato_4 es = ")
                      """
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
                let main = lbFunc1Main
                let funcion = lbFunc1Calcular
                vistaCodigo.lbMain = main
                vistaCodigo.lbFuncsAux = funcion
                vistaCodigo.numlineasFunc1 = 7
                vistaCodigo.numlineasFunc2 = 2
                vistaCodigo.indexSaltos = listaFunciones[indice.row].llamadoFuncs
                
            }
            
            else if listaFunciones[indice.row].tituloFunc == "Funcion 2"{
                let main = lbFunc2Main
                let funcion = lbFunc2Valores
                vistaCodigo.lbMain = main
                vistaCodigo.lbFuncsAux = funcion
                vistaCodigo.numlineasFunc1 = 7
                vistaCodigo.numlineasFunc2 = 5
                vistaCodigo.indexSaltos = listaFunciones[indice.row].llamadoFuncs
            }
            vistaCodigo.funcSelecc = listaFunciones[indice.row]
        }
    }


}

