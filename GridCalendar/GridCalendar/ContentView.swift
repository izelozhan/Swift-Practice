//
//  ContentView.swift
//  GridCalendar
//
//  Created by Izel on 8/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct Day: Identifiable {
    let id = UUID()
    let value: Int
}

struct Month {
    let name: String
    let numberOfDays: Int
    var days: [Day]
    
    init(name: String, numberOfDays: Int, days: [Day]) {
        self.name = name
        self.numberOfDays = numberOfDays
        self.days = days
        
        for n in 1...numberOfDays {
            self.days.append(Day(value: n))
        }
    }
}

let year = [
    Month(name: "January", numberOfDays: 31, days: []),
    Month(name: "February", numberOfDays: 28, days: []),
    Month(name: "March", numberOfDays: 31, days: []),
    Month(name: "April", numberOfDays: 30, days: []),
    Month(name: "May", numberOfDays: 31, days: []),
    Month(name: "June", numberOfDays: 30, days: []),
    Month(name: "July", numberOfDays: 31, days: []),
    Month(name: "August", numberOfDays: 31, days: []),
    Month(name: "September", numberOfDays: 30, days: []),
    Month(name: "October", numberOfDays: 31, days: []),
    Month(name: "November", numberOfDays: 30, days: []),
    Month(name: "December", numberOfDays: 31, days: [])
]

#Preview {
    ContentView()
}
