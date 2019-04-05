//
//  symptoms_diseases.swift
//  SickoSearch
//
//  Created by Monica Eisinger on 4/3/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation

func find_disease(array: [String]) -> ([String]) {


    // should match with 392680, 8031, 27497
    // let user_symptoms = ["shortness of breath", "pain chest","nausea"]
    let user_symptoms = array

    //print "given the user symptoms:"
    //print (user_symptoms)
    //var indices = [Int]()
    var matched_indexes = [Int]()

    // looking through user symptoms, finding the matching string, and returning the index value of that string within symptoms_names

    // find the user symptoms in the symptoms list and save the index values
    for j in user_symptoms {
    
        for (i, x) in symptoms_names.enumerated() {
            if (x == j) {
                matched_indexes.append(i)
                //print("Item \(i): \(x)")
            }
        }
    }

    //print (matched_indexes)

    
    // the corresponding symptom number that the user entered
    var matched_symptom_numbers = [Int]()
    
    
    for i in matched_indexes {
        matched_symptom_numbers.append(symptoms_numbers[i])
    }
    
    //print (matched_symptom_numbers)

    matched_indexes = []
    
    // match those symptom numbers with their corresponding disease numbers
    //find the index # of those numbers in symptom_match_to_disease
    for k in matched_symptom_numbers {
        
        for (i, x) in symptom_match_to_disease.enumerated() {
            if (x == k) {
                matched_indexes.append(i)
                //print("Item \(i): \(x)")
            }
        }
    }
    
    
    //print (matched_indexes)

    
    var matched_diseases = [Int]()
    
    for j in matched_indexes {
        matched_diseases.append(disease_match_to_symptom[j])
    }
    
    //print ("before sort")
    //print (matched_diseases)
    
    // sort them by number of times they appear
    //print ("\ndiseases listed by most frequent:")
  
    
    var counts:[Int:Int] = [:]
    
    for item in matched_diseases {
        counts[item] = (counts[item] ?? 0) + 1
    }
    // print(counts)
    
    // the actual matched disease number
    let result = counts.sorted { $0.value > $1.value }.map { $0.key }
    
    // the number of occurrences of it
    let result2 = counts.sorted { $0.value > $1.value }.map { $0.value}

    matched_diseases.removeAll()
    
    // append matched diseases based on it's number of occurrences
    for i in 0..<result.count {
        
        let num = result2[i]
        for _ in 0..<num {
            matched_diseases.append(result[i])
        }
    }
    
    //print ("after sort")
    //print(matched_diseases)
    
    
    

    var disease = matched_diseases[0]
    
    var count = 0 // current top-n value it's on
    let total_count = 5 // the total number diseases it's looking for
    var top = [1, 1, 1, 1, 1] // change this value based on the above number
    var top_diseases = ["none", "none", "none", "none", "none"]
    

    for i in 1..<matched_diseases.count {
        if (matched_diseases[i] == disease){
            top[count] += 1
            //find the index of the disease in disease_numbers
            let disease_index = disease_numbers.index(of: disease)
            top_diseases[count] = disease_names[disease_index!] // the disease string
    
        } else if (matched_diseases[i] != disease) {
            disease = matched_diseases[i]
            count += 1
        }
        if (count >= total_count) {
            break
        }
    }
    
    
    //print (top)
    
    //print ("top 5 results:")
    //for num in 0..<top_diseases.count {
        //print ("top-\(num+1)  =  \(top_diseases[num])")
    //}
    
    
    //print (top_diseases)
    
    return (top_diseases)

}


let user_symptoms = ["orthopnea", "oliguria", "slowing of urinary stream","extreme exhaustion",
                     "unresponsiveness", "hypotension", "enuresis", "shortness of breath", "haemorrhage"]

//let returned_top_diseases = find_disease(array: user_symptoms)

//print ("returned from function")
//print (returned_top_diseases)



















