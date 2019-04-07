//
//  CustomTableViewCell.swift
//  SickoSearch
//
//  Created by Nafisa Mostofa on 4/6/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    
   // @IBOutlet weak var doctorLabel: UILabel!
    
  @IBOutlet weak var newDocLabel: UILabel!
    
    func setDoctor(doctor: Doctor)
    {
        newDocLabel.text = doctor.name
    }
}
