//
//  ContentView.swift
//  BetterRest
//
//  Created by Izel on 9/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    @State private var coffeeAmount = 1
    var body: some View {
        NavigationStack {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step:0.25)
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 0...20, step:1)
                
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
        }
        
    //LabelsHidden still includes the original label so VoiceOver can use it.
    }
    func calculateBedTime() {
        
    }
}

#Preview {
    ContentView()
}
