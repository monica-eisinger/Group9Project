//
//  diseases_specialist.swift
//  SickoSearch
//
//  Created by Monica Eisinger on 4/4/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation


// specialties

// string, not an array??
func find_specialist(user_chosen_disease: String) -> (String) {

    var returned_specialist = "none"
    
    // find the index of the disease that the user chose
    let specialist_index = disease_names.index(of: user_chosen_disease)
    
    // go to that index in specialties and return the string at that index value
    returned_specialist = specialties[specialist_index!]
    
    print (returned_specialist)
    
    return returned_specialist
    
    
}




