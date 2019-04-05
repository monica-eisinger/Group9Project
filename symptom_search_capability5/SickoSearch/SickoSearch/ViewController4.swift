//
//  ViewController4.swift
//  SickoSearch
//
//  Created by Monica Eisinger on 4/5/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation
import UIKit


class ViewController4: UIViewController {
    
    // the only value affected within this view controller is the background image
    @IBOutlet var background4: UIView!
    
    override func viewDidLoad() {
        background4.backgroundColor = UIColor(patternImage: UIImage(named: "21677087.jpg")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


