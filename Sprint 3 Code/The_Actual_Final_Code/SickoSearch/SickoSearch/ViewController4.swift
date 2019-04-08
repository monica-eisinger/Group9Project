//
//  ViewController4.swift
//  SickoSearch
//
//  Created by Monica Eisinger on 4/5/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation
import UIKit

import SQLite3
import CoreLocation
import MapKit

class ViewController4: UIViewController, UITableViewDataSource, CLLocationManagerDelegate {
 //THIS ONE WORKS
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet var background4: UIView!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var currentLat: Double = 0
    var currentLong: Double = 0
    var db: OpaquePointer?
    var address:String = "none"
    var name:String = "name"
    var specialty:String = "none"
    var actual_speciality:String = "none"
    var specialist_label2:String = "none"
    var specialty_2: String = "none"
    var doctorList = [Doctor]()
    var city: String = "none"
    var state: String = "none"
    var zip: String = "none"
    var phone: String = "none"
    var DoctorName = [Doctor]()
    var longitude_double: Double = 0
    
    func createDoctorArray() -> [Doctor]
    {
        
        let path = Bundle.main.path(forResource: "specialist", ofType: "sqlite")
        // let dbUrl = Bundle.main.url(forResource: "specialist", withExtension: "sqlite")
        if sqlite3_open(path, &db) != SQLITE_OK {
            print("error opening dtabase")
        }
        let queryString  = "SELECT * FROM Doctors"
        
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert \(errmsg)")
        }
        specialist_label2 = find_specialist(user_chosen_disease: chosen_disease)
        // print("i am here")
        while(sqlite3_step(stmt) == SQLITE_ROW)
        {
            specialty = String(cString: sqlite3_column_text(stmt, 15))
            specialty_2 = specialist_label2
            // print("Before if loop: This is specialty: \(specialty_2)")
            //  print("Before if loop: This is specialty from database: \(specialty)")
            if (specialty == "Family Practice")
            {
                // print("I am inside the if loop")
                address = String(cString: sqlite3_column_text(stmt, 1))
                // print("This is address: \(address)")
                name = String(cString: sqlite3_column_text(stmt, 11))
                actual_speciality = String(cString: sqlite3_column_text(stmt, 15))
                city = String(cString: sqlite3_column_text(stmt, 3))
                state = String(cString: sqlite3_column_text(stmt, 4))
                zip = String(cString: sqlite3_column_text(stmt, 5))
                phone = String(cString: sqlite3_column_text(stmt, 7))
               let latitude = String(cString: sqlite3_column_text(stmt, 19))
               let longitude = String(cString: sqlite3_column_text(stmt, 20))
              let  latitude_double = Double(latitude) ?? 0
                longitude_double = Double(longitude) ?? 0
                longitude_double = -1 * longitude_double
                let miles = haversineDinstance(la1: 28.785834, lo1: -81.182350, la2: latitude_double, lo2: longitude_double, radius: 6367444.7)
                if (Int(miles) < chosen_mile)
                {
                doctorList.append(Doctor(name: String(describing: name), address: String(describing: address), city: String(describing: city), state: String(describing: state), zip: String(describing: zip), phone: String(describing: phone), latitude: Double(latitude_double), longitude: Double(longitude_double)))
                }
            }
            
        }
        return doctorList
    }
   
    // the only value affected within this view controller is the background image
    override func viewDidLoad()
{
    background4.backgroundColor = UIColor(patternImage: UIImage(named: "21677087.jpg")!)
    super.viewDidLoad()
    print("this is chosen mile: \(chosen_mile)")
    DoctorName = createDoctorArray()
    
    self.TableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
    self.TableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MastertoDetail"{
            let destVC = segue.destination as! ViewControllerDetail
            destVC.doctor = sender as? Doctor
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return DoctorName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:  "cell")
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       let physician: Doctor
         physician = DoctorName[indexPath.row]
     
        let cell = self.TableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        cell.textLabel?.text = physician.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //tableView.deselectRow(at: indexPath, animated: true)
        //print(DoctorName[indexPath.row])
        //let specialist = DoctorName[indexPath.row]
        //performSegue(withIdentifier: "MastertoDetail", sender: specialist)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewController5") as! ViewController5
        self.navigationController?.pushViewController(controller, animated: true)
    }
    


   
func haversineDinstance(la1: Double, lo1: Double, la2: Double, lo2: Double, radius: Double = 6367444.7) -> Double {
    
    let haversin = { (angle: Double) -> Double in
        return (1 - cos(angle))/2
    }
    
    let ahaversin = { (angle: Double) -> Double in
        return 2*asin(sqrt(angle))
    }
    
    // Converts from degrees to radians
    let dToR = { (angle: Double) -> Double in
        return (angle / 360) * 2 * .pi
    }
    
    let lat1 = dToR(la1)
    let lon1 = dToR(lo1)
    let lat2 = dToR(la2)
    let lon2 = dToR(lo2)
    
    let km = (radius * ahaversin(haversin(lat2 - lat1) + cos(lat1) * cos(lat2) * haversin(lon2 - lon1))) / 1000
    let mile = km * 0.621371
    print("This is miles: \(mile)")
    return km * 0.621371
}
    
    
    
    
    
    
   // func readValues(){
    
        
   // }
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
/*
    var db: OpaquePointer?
    var address:String = "none"
    var name:String = "name"
    var specialty:String = "none"
    var actual_speciality:String = "none"
    var specialist_label:String = "none"
    var specialty_2: String = "none"
    var doctorList = [Doctor]()
    var city: String = "none"
    var state: String = "none"
    var zip: String = "none"
    var phone: String = "none"
    var DoctorName = [String]()
    
    
    // the only value affected within this view controller is the background image
    override func viewDidLoad()
    {
        //background4.backgroundColor = UIColor(patternImage: UIImage(named: "21677087.jpg")!)
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "specialist", ofType: "sqlite")
        // let dbUrl = Bundle.main.url(forResource: "specialist", withExtension: "sqlite")
        if sqlite3_open(path, &db) != SQLITE_OK {
            print("error opening dtabase")
        }
        let queryString  = "SELECT * FROM Doctors"
        
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert \(errmsg)")
            return
        }
        specialist_label = find_specialist(user_chosen_disease: chosen_disease)
        // print("i am here")
        while(sqlite3_step(stmt) == SQLITE_ROW)
        {
            specialty = String(cString: sqlite3_column_text(stmt, 15))
            specialty_2 = specialist_label
            // print("Before if loop: This is specialty: \(specialty_2)")
            //  print("Before if loop: This is specialty from database: \(specialty)")
            if (specialty == specialty_2)
            {
                // print("I am inside the if loop")
                address = String(cString: sqlite3_column_text(stmt, 1))
                // print("This is address: \(address)")
                name = String(cString: sqlite3_column_text(stmt, 11))
                actual_speciality = String(cString: sqlite3_column_text(stmt, 15))
                let city = String(cString: sqlite3_column_text(stmt, 3))
                let state = String(cString: sqlite3_column_text(stmt, 4))
                let zip = String(cString: sqlite3_column_text(stmt, 5))
                let phone = String(cString: sqlite3_column_text(stmt, 7))
                doctorList.append(Doctor(name: String(describing: name), address: String(describing: address), city: String(describing: city), state: String(describing: state), zip: String(describing: zip), phone: String(describing: phone)))
            }
            
        }
        
        //self.tableViewDoctors.reloadData()
    }
    
    
    
    
    
    // func readValues(){
    
    
    // }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}

}
*/

