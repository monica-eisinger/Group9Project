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
import SQLite

class TableViewController: UITableViewController {

    @IBOutlet var doctorView: UITableView!
    
    var currentLat: Double = 0
    var currentLong: Double = 0
    var database: OpaquePointer?
    var stmt:OpaquePointer? = nil
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
    
    //Connects to database
    func connectToDatabase()
    {
        let path = Bundle.main.path(forResource: "specialist", ofType: "sqlite")
        // let dbUrl = Bundle.main.url(forResource: "specialist", withExtension: "sqlite")
        if sqlite3_open(path, &database) != SQLITE_OK {
            print("Error opening database")
        }
        let queryString  = "SELECT * FROM Doctors"
        
        if sqlite3_prepare(database, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(database)!)
            print("error preparing insert \(errmsg)")
        }
        
    }
    
    //Creates the array based on the specialist and miles chosen by user
    func createDoctorArray() -> [Doctor]
    {
        connectToDatabase()
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
               let distance_in_miles = DistanceinMiles(user_latitude: current_latitude, user_longitude: current_longitude, doc_latitude: latitude_double, doc_longitude: longitude_double, radius: 6367444.7)
                
                //Checks if the distance is within a certain mileage that the user picked
                if (Int(distance_in_miles) < chosen_mile)
                {
                    //Concatenates the address with city, state, and zip
                    let concat_address = address+", "+city+" "+state+","+zip
                    
                    //Concatenates the phone with dashes
                    let concat_number = phone.toPhoneNumber()
                    
                    //Changes the last name so that all but the first letter are capitazilez
                    lowerCase_last = last_name.lowercased()
                    lowerCase_last = lowerCase_last.capitalizingFirstLetter()
                    
                    //Concates the doctor's first and last name
                    let concat_name = "Dr. "+first_name+" "+lowerCase_last
                    
                    //Adds all these attributes to the doctor list for further use
                    doctorList.append(Doctor(name: String(describing: concat_name), address: String(describing: concat_address), phone: String(describing: concat_number)))
                }
            }
        }
        return doctorList
    }
    
    
    //Function to find the distance in miles from the coordinates of the two locations
    func DistanceinMiles(user_latitude: Double, user_longitude: Double, doc_latitude: Double, doc_longitude: Double, radius: Double = 6367444.7) -> Double {
        
        let haversin = { (angle: Double) -> Double in
            return (1 - cos(angle))/2
        }
        
        let ahaversin = { (angle: Double) -> Double in
            return 2*asin(sqrt(angle))
        }
        
        // Converts from degrees to radians
        let DegToRad = { (angle: Double) -> Double in
            return (angle / 360) * 2 * .pi
        }
        
        let user_latitude = DegToRad(user_latitude)
        let user_longitude = DegToRad(user_longitude)
        let doc_latitude = DegToRad(doc_latitude)
        let doc_longitude = DegToRad(doc_longitude)
        
        let km = (radius * ahaversin(haversin(doc_latitude - user_latitude) + cos(user_latitude) * cos(doc_latitude) * haversin(doc_longitude - user_longitude))) / 1000
        let mile = km * 0.621371
        return mile
    }
    
    //Sets up Navigation Bar
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
    
    //Prepares the table view to send over th information of each table cell to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MasterToDetail" {
            let destVC = segue.destination as! ViewControllerDetail
            destVC.doctor = sender as? Doctor
        }
    }
    
    //Number of section in table
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //Dynamically allocates the number of rows in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DoctorName.count
    }
    
    //Populates the cell with the doctor's name, address, and phone number
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let physician: Doctor
        physician = DoctorName[indexPath.row]
        
        let cell = doctorView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! DoctorTableViewCell
      
        cell.setDoctor(doctor: physician)
        return cell
    }
    
    //Allows the user to click on each cell which segues to the next view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let doctor_seg = DoctorName[indexPath.row]
        performSegue(withIdentifier: "MasterToDetail", sender: doctor_seg)
    }
}

//Fixes the phone number and first and last name
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



