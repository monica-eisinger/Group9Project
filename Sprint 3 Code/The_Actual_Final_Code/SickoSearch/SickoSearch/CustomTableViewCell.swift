//
//  CustomTableViewCell.swift
//  SickoSearch
//
//  Created by Nafisa Mostofa on 4/6/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation
import UIKit

//Sets the Table Cells to the Doctor's Name
class DoctorTableViewCell: UITableViewCell {
    
  @IBOutlet weak var newDocLabel: UILabel!
    
    //This set's the table view cell with the Doctor's name
    func setDoctor(doctor: Doctor)
    {
        newDocLabel.text = doctor.name
    }
}
