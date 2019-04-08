//
//  ViewControllerDetail.swift
//  SickoSearch
//
//  Created by Nafisa Mostofa on 4/6/19.
//  Copyright © 2019 *. All rights reserved.
//

import UIKit
import Foundation

class ViewControllerDetail: UIViewController {

    //Background for UI Controller
    @IBOutlet var backgroundPhysician: UIView!
    
    //Labels for all the Doctor Information
    @IBOutlet weak var DocLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var PhoneLabel: UILabel!
    
    //Allows the user to call the number directly from the app
    @IBAction func phoneCall(_ sender: Any) {
        let phoneString = PhoneLabel.text?.replacingOccurrences(of: "-", with: "")
        guard let numberString = phoneString, let url = URL(string: "telprompt://\(numberString)") else{
            return
        }
        UIApplication.shared.open(url)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundPhysician.backgroundColor = UIColor(patternImage: UIImage(named: "21677087.jpg")!)

        setUIDoctorInfo()
    }
    
    
    //Ready to accept the doctor detail from table
    var doctor: Doctor?
    
    //Sets up the labels with the name, address, and phone number
    func setUIDoctorInfo(){
        DocLabel.text = doctor?.name
        AddressLabel.text = doctor?.address
        PhoneLabel.text = doctor?.phone
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
