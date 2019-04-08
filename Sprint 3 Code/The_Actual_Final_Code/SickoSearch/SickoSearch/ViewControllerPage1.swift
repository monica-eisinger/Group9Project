//
//  ViewControllerPage1.swift
//  SickoSearch
//
//  Created by Monica Eisinger on 4/5/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerPage1: UIViewController{
    
    // the only value affected within this view controller is the background image
    @IBOutlet var background1: UIView!
    
    //This button will begin the app and start searching for diseases
    @IBAction func beginApp(_ sender: Any) {
        performSegue(withIdentifier: "beginApp", sender: sender)
    }
    override func viewDidLoad() {
        background1.backgroundColor = UIColor(patternImage: UIImage(named: "21677087.jpg")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
