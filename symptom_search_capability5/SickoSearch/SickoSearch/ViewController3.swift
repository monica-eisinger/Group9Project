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
    
    // label for the specialist returned to show to the user
    @IBOutlet weak var show_specialist: UILabel!
    
    // the background imahe
    @IBOutlet var background4: UIView!
    
    override func viewDidLoad() {
        
        background4.backgroundColor = UIColor(patternImage: UIImage(named: "21677087.jpg")!)
        
        // get the returned specialist and display it
        let specialist_label = find_specialist(user_chosen_disease: chosen_disease)
        show_specialist.text = "is a \(specialist_label)"
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    
    
}


