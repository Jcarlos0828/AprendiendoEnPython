//
//  VisualCodeViewController.swift
//  Prototipo1
//
//  Created by user190015 on 4/17/21.
//

import UIKit

class VisualCodeViewController: UIViewController {

    @IBOutlet weak var lbvalorVariable_1: UILabel!
    @IBOutlet weak var tfvalorVariable_1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfvalorVariable_1.isHidden = true
    }
    
    @IBAction func cambiaModo(_ sender: UISegmentedControl) {
        lbvalorVariable_1.isHidden = !lbvalorVariable_1.isHidden
        
        tfvalorVariable_1.isHidden = !lbvalorVariable_1.isHidden
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
