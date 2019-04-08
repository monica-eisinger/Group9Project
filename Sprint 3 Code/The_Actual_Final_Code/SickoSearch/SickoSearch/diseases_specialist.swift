//
//  diseases_specialist.swift
//  SickoSearch
//
//  Created by Monica Eisinger on 4/4/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation


// pass in the disease the user chose and return the specialist that treats that disease
func find_specialist(user_chosen_disease: String) -> (String) {

    var returned_specialist = "none"
    
    // find the index of the disease that the user chose
    let specialist_index = disease_names.index(of: user_chosen_disease)
    
    // go to that index in specialties and return the string at that index value
    returned_specialist = specialties[specialist_index!]
    
    return returned_specialist
    
}

