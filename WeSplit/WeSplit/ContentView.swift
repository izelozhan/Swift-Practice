//
//  ContentView.swift
//  WeSplit
//
//  Created by Izel Ozhan on 9/2/25.
//

import SwiftUI


struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section {
                    Text("How much tip do you want to leave?")
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    //Since it's State, it auto check for changes/updates.
                    //Locale is a massive struct built into iOS, responsible for storing all the user's region settings
                }
            }.navigationTitle("WeSplit").navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

//this is special piece of code that won't actually form part of your final app that goes to the app store.
#Preview {
    ContentView()
}
