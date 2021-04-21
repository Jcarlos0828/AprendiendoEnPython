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


}

