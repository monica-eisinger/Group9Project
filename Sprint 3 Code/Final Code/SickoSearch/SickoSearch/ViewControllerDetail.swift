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

    @IBOutlet var backgroundPhysician: UIView!
    @IBOutlet weak var DocLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var PhoneLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundPhysician.backgroundColor = UIColor(patternImage: UIImage(named: "21677087.jpg")!)

        setUI()
    }
    
    
    //Ready to accept the doctor detail from table
    var doctor: Doctor?
    func setUI(){
        DocLabel.text = doctor?.name
        AddressLabel.text = doctor?.address
        PhoneLabel.text = doctor?.phone
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
