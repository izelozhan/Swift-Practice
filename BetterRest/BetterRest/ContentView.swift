//
//  ContentView.swift
//  BetterRest
//
//  Created by Izel on 9/12/25.
//
import CoreML
import SwiftUI

struct ContentView: View {
    // MARK: - State
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Self.defaultWakeTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.blue.opacity(0.7), .mint.opacity(0.7), .blue.opacity(0.6)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    // Wake Up Card
                    Card {
                        HStack(spacing: 12) {
                            Image(systemName: "alarm.fill")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .padding(10)
                                .background(Circle().fill(.indigo))
                                .accessibilityHidden(true)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("When do you want to wake up?")
                                    .font(.headline)
                                DatePicker(
                                    "Please enter a time",
                                    selection: $wakeUp,
                                    displayedComponents: .hourAndMinute
                                )
                                .labelsHidden()
                                .tint(.indigo)
                                .accessibilityLabel("Wake up time")
                            }
                            Spacer(minLength: 0)
                        }
                    }
                    
                    // Sleep Amount Card
                    Card {
                        HStack(spacing: 12) {
                            Image(systemName: "bed.double.fill")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .padding(10)
                                .background(Circle().fill(.pink))
                                .accessibilityHidden(true)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Desired amount of sleep")
                                    .font(.headline)
                                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                                    Text(sleepAmount, format: .number.precision(.fractionLength(0...2))) +
                                    Text(" hours")
                                        .foregroundStyle(.secondary)
                                }
                                .accessibilityLabel("Desired amount of sleep")
                                .accessibilityValue("\(sleepAmount) hours")
                            }
                            Spacer(minLength: 0)
                        }
                    }
                    
                    // Coffee Card
                    Card {
                        HStack(spacing: 12) {
                            Image(systemName: "cup.and.saucer.fill")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .padding(10)
                                .background(Circle().fill(.orange))
                                .accessibilityHidden(true)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Daily coffee intake")
                                    .font(.headline)
                                Stepper(value: $coffeeAmount, in: 0...20, step: 1) {
                                    Text("\(coffeeAmount) ") +
                                    Text(coffeeAmount == 1 ? "cup" : "cups")
                                        .foregroundStyle(.secondary)
                                }
                                .accessibilityLabel("Daily coffee intake")
                                .accessibilityValue("\(coffeeAmount) \(coffeeAmount == 1 ? "cup" : "cups")")
                            }
                            Spacer(minLength: 0)
                        }
                    }
                    
                    // Calculate Button
                    Button(action: calculateBedTime) {
                        HStack {
                            Image(systemName: "moon.zzz.fill")
                            Text("Calculate Ideal Bedtime")
                                .fontWeight(.semibold)
                        }
                        .padding(.vertical, 14)
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(radius: 6, y: 3)
                    .padding(.top, 4)
                }
                .padding(16)
            }
            .navigationTitle("BetterRest")
            .navigationBarTitleDisplayMode(.inline)
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hourInSeconds = (components.hour ?? 0) * 60 * 60
            let minuteInSeconds = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(
                wake: Double(hourInSeconds + minuteInSeconds),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            showingAlert = true
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            showingAlert = true
        }
    }
}

// MARK: - Helpers
extension ContentView {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
}

// MARK: - Reusable Card
private struct Card<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        content
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(radius: 4, y: 2)
            .animation(.easeInOut(duration: 0.2), value: UUID())
    }
}

#Preview {
    ContentView()
}
