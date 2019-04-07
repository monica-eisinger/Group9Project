//
//  TableViewController.swift
//  SickoSearch
//
//  Created by Nafisa Mostofa on 4/7/19.
//  Copyright © 2019 *. All rights reserved.
//

import UIKit
import Foundation
import SQLite3


class TableViewController: UITableViewController {

    @IBOutlet var doctorView: UITableView!
    
    var currentLat: Double = 0
    var currentLong: Double = 0
    var db: OpaquePointer?
    var current_specialty:String = "none"
    var actual_speciality:String = "none"
    var doctorList = [Doctor]()
    var DoctorName = [Doctor]()
    var lowerCase_last:String = "none"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DoctorName = createDoctorArray()
        setupNavBar()
    }
    
    func createDoctorArray() -> [Doctor]
    {
        
        let path = Bundle.main.path(forResource: "specialist", ofType: "sqlite")
        // let dbUrl = Bundle.main.url(forResource: "specialist", withExtension: "sqlite")
        if sqlite3_open(path, &db) != SQLITE_OK {
            print("error opening dtabase")
        }
        let queryString  = "SELECT * FROM Doctors"
        
        var stmt:OpaquePointer? = nil
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert \(errmsg)")
        }
        
        actual_speciality = find_specialist_Database(user_chosen_disease: chosen_disease)
        while(sqlite3_step(stmt) == SQLITE_ROW)
        {
            current_specialty = String(cString: sqlite3_column_text(stmt, 15))
            if (current_specialty == actual_speciality)
            {
     
               let address = String(cString: sqlite3_column_text(stmt, 1))
               let first_name = String(cString: sqlite3_column_text(stmt, 9))
               let last_name = String(cString: sqlite3_column_text(stmt, 10))
               let city = String(cString: sqlite3_column_text(stmt, 3))
               let state = String(cString: sqlite3_column_text(stmt, 4))
               let zip = String(cString: sqlite3_column_text(stmt, 5))
               let phone = String(cString: sqlite3_column_text(stmt, 7))
               let latitude = String(cString: sqlite3_column_text(stmt, 19))
               let longitude = String(cString: sqlite3_column_text(stmt, 20))
               let  latitude_double = Double(latitude) ?? 0
               var longitude_double = Double(longitude) ?? 0
               longitude_double = -1 * longitude_double
                
               //Receives the distance in miles from current location and doctors office
               let distance_in_miles = haversineDinstance(la1: current_latitude, lo1: current_longitude, la2: latitude_double, lo2: longitude_double, radius: 6367444.7)
                
                if (Int(distance_in_miles) < chosen_mile)
                {
                    let concat_address = address+", "+city+" "+state+","+zip
                    let concat_number = phone.toPhoneNumber()
                    lowerCase_last = last_name.lowercased()
                    lowerCase_last = lowerCase_last.capitalizingFirstLetter()
                    let concat_name = "Dr. "+first_name+" "+lowerCase_last
                    doctorList.append(Doctor(name: String(describing: concat_name), address: String(describing: concat_address), phone: String(describing: concat_number)))
                }
            }
        }
        return doctorList
    }
    //Function to find the distance in miles from the coordinates of the two locations
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
        return mile
    }
    
    func setupNavBar() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
        let searchController = UISearchController(searchResultsController: nil)
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        } else {
            // Fallback on earlier versions
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MasterToDetail" {
            let destVC = segue.destination as! ViewControllerDetail
            destVC.doctor = sender as? Doctor
        }
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DoctorName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:  "cell")
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let physician: Doctor
        physician = DoctorName[indexPath.row]
        
        //let cell = self.doctorView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        let cell = doctorView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
       // cell.textLabel?.text = physician.name
        cell.setDoctor(doctor: physician)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let doctor_seg = DoctorName[indexPath.row]
        performSegue(withIdentifier: "MasterToDetail", sender: doctor_seg)
    }
}
extension String {
    public func toPhoneNumber() -> String{
        return self.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "$1-$2-$3", options: .regularExpression, range: nil)
    }
    
    func capitalizingFirstLetter() -> String{
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}



