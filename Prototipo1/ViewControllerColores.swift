//
//  ViewControllerColores.swift
//  Prototipo1
//
//  Created by user190015 on 5/16/21.

//  Proyecto final desarrollado por:
//    - Jose Carlos del Castillo Estrada | A00822554
//    - Adolfo Benjamin Lerma Villalobos | A00822029

import UIKit

class ViewControllerColores: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //Cada paleta esta guardada en un arreglo
    var listaColores = [
        Colores(nombre : "Default verde", paleta : [UIColorFromRGB(0x99B998),UIColorFromRGB(0xFDCEAA),UIColorFromRGB(0xF4837D),UIColorFromRGB(0xEB4960),UIColorFromRGB(0x27363B)]),
        Colores(nombre: "Modo claro", paleta: [UIColorFromRGB(0xE8E5E0),UIColorFromRGB(0xAACFD5),UIColorFromRGB(0x68B8C1),UIColorFromRGB(0x298A91),UIColorFromRGB(0xF77432)]),
        Colores(nombre: "Colores frios", paleta: [UIColorFromRGB(0xF2FBE0),UIColorFromRGB(0xCAB1BD),UIColorFromRGB(0x6096BA),UIColorFromRGB(0x673C4F),UIColorFromRGB(0x004346)])
    ]

    @IBOutlet weak var color1: UIView!
    @IBOutlet weak var color2: UIView!
    @IBOutlet weak var color3: UIView!
    @IBOutlet weak var color4: UIView!
    @IBOutlet weak var color5: UIView!
    
    //Auxiliares que guardan el color actual para mostrar
    var tCol1 = UIColor()
    var tCol2 = UIColor()
    var tCol3 = UIColor()
    var tCol4 = UIColor()
    var tCol5 = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        color1.backgroundColor = tCol1
        color2.backgroundColor = tCol2
        color3.backgroundColor = tCol3
        color4.backgroundColor = tCol4
        color5.backgroundColor = tCol5
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaColores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda")!
        cell.textLabel?.text = listaColores[indexPath.row].nombre
        //Mostrar en la celda el primer color de la paleta
        cell.textLabel?.backgroundColor = listaColores[indexPath.row].paleta[0]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let indice = indexPath.row
        let colorActual = listaColores[indice].paleta
        color1.backgroundColor = colorActual[0]
        color2.backgroundColor = colorActual[1]
        color3.backgroundColor = colorActual[2]
        color4.backgroundColor = colorActual[3]
        color5.backgroundColor = colorActual[4]
        
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaIni = segue.destination as! ViewController
        vistaIni.mainColor1 = color1.backgroundColor!
        vistaIni.mainColor2 = color2.backgroundColor!
        vistaIni.mainColor3 = color3.backgroundColor!
        vistaIni.mainColor4 = color4.backgroundColor!
        vistaIni.mainColor5 = color5.backgroundColor!
    }
}
