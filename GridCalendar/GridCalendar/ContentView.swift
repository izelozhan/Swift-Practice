//
//  ContentView.swift
//  GridCalendar
//
//  Created by Izel on 8/18/25.
//

import SwiftUI

struct ContentView: View {

    private let layout: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 40)), count: 7)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 8) {
                ForEach(year, id: \.name) { month in
                    Section(header:
                        Text(month.name)
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 12)
                    ) {
                        ForEach(month.days) { day in
                            Capsule()
                                .frame(height: 40)
                                .foregroundStyle(.indigo)
                                .overlay(
                                    Text("\(day.value)")
                                        .foregroundStyle(.white)
                                )
                        }
                    }
                }
            }
            .padding()
        }
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

    init(name: String, numberOfDays: Int) {
        self.name = name
        self.numberOfDays = numberOfDays
        self.days = (1...numberOfDays).map { Day(value: $0) }
    }
}

// MARK: - Data

let year: [Month] = [
    Month(name: "January",   numberOfDays: 31),
    Month(name: "February",  numberOfDays: 28),
    Month(name: "March",     numberOfDays: 31),
    Month(name: "April",     numberOfDays: 30),
    Month(name: "May",       numberOfDays: 31),
    Month(name: "June",      numberOfDays: 30),
    Month(name: "July",      numberOfDays: 31),
    Month(name: "August",    numberOfDays: 31),
    Month(name: "September", numberOfDays: 30),
    Month(name: "October",   numberOfDays: 31),
    Month(name: "November",  numberOfDays: 30),
    Month(name: "December",  numberOfDays: 31)
]

#Preview {
    ContentView()
}

