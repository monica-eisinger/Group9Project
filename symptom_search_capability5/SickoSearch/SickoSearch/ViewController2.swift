//
//  ViewController2.swift
//  SickoSearch
//
//  Created by Monica Eisinger on 4/4/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation
import UIKit

var top_5_diseases = ["", "", "", "", ""]
var chosen_disease = "none"

class ViewController2: UIViewController{
    @IBOutlet var background3: UIView!
    
    // functions to assign a chosen_disease value based on the button the user pressed
    @IBAction func disease_button1(_ sender: Any) {
        chosen_disease = top_5_diseases[0]
    }
    
    @IBAction func disease_button2(_ sender: Any) {
        chosen_disease = top_5_diseases[1]
    }
    
    @IBAction func disease_button3(_ sender: Any) {
        chosen_disease = top_5_diseases[2]
    }
    
    @IBAction func disease_button4(_ sender: Any) {
        chosen_disease = top_5_diseases[3]
    }
    
    @IBAction func disease_button5(_ sender: Any) {
        chosen_disease = top_5_diseases[4]
    }
    
    // labels for displaying the diseases
    @IBOutlet weak var disease1: UILabel!
    @IBOutlet weak var disease2: UILabel!
    @IBOutlet weak var disease3: UILabel!
    @IBOutlet weak var disease4: UILabel!
    @IBOutlet weak var disease5: UILabel!

    override func viewDidLoad() {
        
        background3.backgroundColor = UIColor(patternImage: UIImage(named: "21677087.jpg")!) 
        
        // passes the values entered into the text box to the
        // find_disease function, which returns 5 diseases the person matched to
        top_5_diseases = find_disease(array: dropdownval)

        // update the labels
        disease1.text = top_5_diseases[0]
        disease1.sizeToFit()
        
        disease2.text = top_5_diseases[1]
        disease2.sizeToFit()
        
        disease3.text = top_5_diseases[2]
        disease3.sizeToFit()
        
        disease4.text = top_5_diseases[3]
        disease4.sizeToFit()
        
        disease5.text = top_5_diseases[4]
        disease5.sizeToFit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
