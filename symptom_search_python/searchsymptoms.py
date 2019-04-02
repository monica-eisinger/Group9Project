
# holds all of the data in array values
import os
import sys
import my_data


from my_data import symptoms_names
from my_data import symptoms_numbers
from my_data import disease_match_to_symptom
from my_data import symptom_match_to_disease


# save these from the user entering them


# should match with 392680, 8031, 27497
user_symptoms = ["shortness of breath", "pain chest","nausea"]
indices = []
matched_indexes = []

# find the user symptoms in the symptoms list and save the index values
for j in user_symptoms:
    indices = [i for i, x in enumerate(symptoms_names) if x == j ]
    #print (indices)
    for i in indices:
        matched_indexes.append(i)

print matched_indexes

# the corresponding symptom number that the user entered
matched_symptom_numbers = []


for i in matched_indexes:
    matched_symptom_numbers.append(symptoms_numbers[i])

print matched_symptom_numbers

# match those symptom numbers with their corresponding disease numbers

# save the top-5 diseases, print them out in order















