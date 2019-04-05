//
//  symptoms_diseases.swift
//  SickoSearch
//
//  Created by Monica Eisinger on 4/3/19.
//  Copyright © 2019 *. All rights reserved.
//

import Foundation

// pass in the values entered into the dropdown box, and it returns 5 diseases that the user matches to
func find_disease(array: [String]) -> ([String]) {


    let user_symptoms = array
    var matched_indexes = [Int]()

    // looking through user symptoms, finding the matching string, and returning the index value of that string within symptoms_names
    for j in user_symptoms {
        for (i, x) in symptoms_names.enumerated() {
            if (x == j) {
                matched_indexes.append(i)
            }
        }
    }

    
    // the corresponding symptom number that the user entered
    var matched_symptom_numbers = [Int]()
    
    for i in matched_indexes {
        matched_symptom_numbers.append(symptoms_numbers[i])
    }


    matched_indexes = []
    
    // match those symptom numbers with their corresponding disease numbers
    // find the index # of those numbers in symptom_match_to_disease
    for k in matched_symptom_numbers {
        for (i, x) in symptom_match_to_disease.enumerated() {
            if (x == k) {
                matched_indexes.append(i)
            }
        }
    }
    
    var matched_diseases = [Int]()
    
    for j in matched_indexes {
        matched_diseases.append(disease_match_to_symptom[j])
    }

    // sort the matched diseases by most frequent --> least frequent
    var counts:[Int:Int] = [:]
    
    for item in matched_diseases {
        counts[item] = (counts[item] ?? 0) + 1
    }
    
    // the actual matched disease number
    let result = counts.sorted { $0.value > $1.value }.map { $0.key }
    
    // the number of occurrences of it
    let result2 = counts.sorted { $0.value > $1.value }.map { $0.value}

    // clear the array to be re-filled with sorted values
    matched_diseases.removeAll()
    
    // append matched diseases based on it's number of occurrences
    for i in 0..<result.count {
        
        let num = result2[i]
        for _ in 0..<num {
            matched_diseases.append(result[i])
        }
    }


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
    
    return (top_diseases)

}


// for testing
//let user_symptoms = ["orthopnea", "oliguria", "slowing of urinary stream","extreme exhaustion", "unresponsiveness", "hypotension", "enuresis", "shortness of breath", "haemorrhage"]



