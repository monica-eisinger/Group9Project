//
//  ViewController3.swift
//  SickoSearch
//
//  Created by Monica Eisinger on 4/4/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation
import UIKit
import MapKit

import SQLite3
import CoreLocation

var chosen_mile = 10
var current_latitude: Double = 0
var current_longitude: Double = 0

class ViewController3: UIViewController, CLLocationManagerDelegate{
    
    // label for the specialist returned to show to the user
    @IBOutlet weak var show_specialist: UILabel!
    var locationManager = CLLocationManager()
    // the background imahe
    @IBOutlet var background4: UIView!
    
    @IBOutlet weak var fiveMilesButton: UIButton!
    @IBOutlet weak var tenMilesButton: UIButton!
    
   
    @IBAction func fiveMilesAction(_ sender: Any) {
        chosen_mile = 5
        performSegue(withIdentifier: "pickMiles", sender: sender)
    }
    
    @IBAction func tenMilesAction(_ sender: Any) {
        chosen_mile = 10
        performSegue(withIdentifier: "pickMiles", sender: sender)
    }
    @IBAction func fifteenMilesAction(_ sender: Any) {
        chosen_mile = 15
        performSegue(withIdentifier: "pickMiles", sender: sender)
    }
    @IBOutlet weak var fifteenMilesButton: UIButton!
    
    
    override func viewDidLoad() {
        
        background4.backgroundColor = UIColor(patternImage: UIImage(named: "21677087.jpg")!)
        
        // get the returned specialist and display it
        let specialist_label = find_specialist(user_chosen_disease: chosen_disease)
        show_specialist.text = "is a \(specialist_label)"
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue: CLLocationCoordinate2D = manager.location!.coordinate
        current_latitude = locValue.latitude
        current_longitude = locValue.longitude
       // let userLocation = locations.last
       
    }
    
}


