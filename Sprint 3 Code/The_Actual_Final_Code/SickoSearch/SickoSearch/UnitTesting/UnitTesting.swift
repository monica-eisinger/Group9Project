//
//  UnitTesting.swift
//  UnitTesting
//
//  Created by Riley Dickens on 4/8/19.
//  Copyright © 2019 *. All rights reserved.
//

import XCTest
import UIKit
@testable import SickoSearch

class UnitTesting: XCTestCase {
    
    override func setUp(){
        super.setUp()
    }
    
    override func tearDown(){
        super.tearDown()
    }
    
    func testDiseasesFinder(){
        let symptoms = ["shortness of breath", "pain chest", "sneeze", "fever", "sleeplessness", "rambling speech", "unsteady gait", "sweat", "dizziness", "sore to touch"]
        let disease =  find_disease(array: symptoms)
        let correct = ["", "", "", "", ""]
        
        XCTAssertNotEqual(disease, correct)
    }
    
    func testSpecialistFinder(){
        let specialists = "General Practitioner"
        let specialistsFound = find_specialist(user_chosen_disease: "dementia")
        
        XCTAssertEqual(specialists, specialistsFound)
    }
    

}
