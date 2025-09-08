//
//  School Roster\.swift
//  
//
//  Created by Izel on 9/8/25.
//

import Foundation

var spanish101: Set = ["Angela", "Declan", "Aldany", "Alex", "Sonny", "Alif", "Skyla"]
var german101: Set = ["Angela", "Alex", "Declan", "Kenny", "Cynara", "Adam"]
var advancedCalculus: Set = ["Cynara", "Gabby", "Angela", "Samantha", "Ana", "Aldany", "Galina", "Jasmine"]
var artHistory: Set = ["Samantha", "Vanessa", "Aldrian", "Cynara", "Kenny", "Declan", "Skyla"]
var englishLiterature: Set = ["Gabby", "Jasmine", "Alex", "Alif", "Aldrian", "Adam", "Angela"]
var computerScience: Set = ["Galina", "Kenny", "Sonny", "Alex", "Skyla"]


var allStudents = spanish101.union(german101)
allStudents = allStudents.union(advancedCalculus)
allStudents = allStudents.union(artHistory)
allStudents = allStudents.union(englishLiterature)
allStudents = allStudents.union(computerScience)

for student in allStudents {
  print(student)
}

var noLanguage = spanish101.union(german101)

var noLanguageSet = allStudents.subtracting(noLanguage)

for student in noLanguageSet {
  print(student)
}

var spanishOrGerman = spanish101.symmetricDifference(german101)

for student in spanishOrGerman {
  print(student)
}


var languageAwardWinners = spanish101.intersection(german101)

languageAwardWinners = languageAwardWinners.intersection(englishLiterature)

for student in languageAwardWinners {
  print(student)
}

var sevenPlus = 0

var classSet: Set = [spanish101, german101, englishLiterature, computerScience, artHistory, advancedCalculus]


for class1 in classSet {
  if class1.count >= 7 {
    sevenPlus += 1
  }
}

print(sevenPlus)
