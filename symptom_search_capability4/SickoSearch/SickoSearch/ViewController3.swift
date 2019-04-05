//
//  ViewController3.swift
//  SickoSearch
//
//  Created by Monica Eisinger on 4/4/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation

import UIKit



class ViewController3: UIViewController{
    
    @IBOutlet weak var show_specialist: UILabel!
    
    
    
    override func viewDidLoad() {
        
        // run the function and get the returned specialist
        let specialist_label = find_specialist(user_chosen_disease: chosen_disease)
        
        show_specialist.text = "is a \(specialist_label)"
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


