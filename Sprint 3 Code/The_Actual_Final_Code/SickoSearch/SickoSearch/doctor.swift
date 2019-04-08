//
//  doctor.swift
//  SickoSearch
//
//  Created by Nafisa Mostofa on 4/5/19.
//  Copyright © 2019 *. All rights reserved.
//
import Foundation
import SQLite3
import SQLite

//Class for each Doctor that holds the name, address, and phone
class Doctor {
    var name: String?
    var address: String?
    var phone: String?

    init(name: String?, address: String?, phone: String?)
    {
        self.name = name
        self.address = address
        self.phone = phone
    }
    
    
}




