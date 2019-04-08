//
//  find_specialist_DB.swift
//  SickoSearch
//
//  Created by Nafisa Mostofa on 4/7/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation

//Matches the specialty with the specialist from the database
func find_specialist_Database(user_chosen_disease: String) -> (String) {
    
    var db_specialist = "none"
    
    // find the index of the disease that the user chose
    let specialist_index = disease_names.index(of: user_chosen_disease)
    
    // go to that index in specialties and return the string at that index value
    db_specialist = database_specialist[specialist_index!]
    
    return db_specialist
    
}
