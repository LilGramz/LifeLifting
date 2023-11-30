//
//  FemaleView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/18/23.
//

import SwiftUI

struct FemaleView: View {
    @State private var feet: Int = 5
    @State private var inches: Int = 8
    @State private var weightInPounds: Int = 150
    @State private var age: Int = 30
    @State private var selectedActivityLevel: Double = 1 // Change the type to Double
    
    @State private var bmrResult: Double = 0
    @State private var bmiResult: Double = 0
    @State private var amrResult: Double = 0
    
    private let activityLevelDescriptions = [
        "Sedentary (little or no exercise)",
        "Lightly active (exercise 1–3 days/week)",
        "Moderately active (exercise 3–5 days/week)",
        "Active (exercise 6–7 days/week)",
        "Very active (hard exercise 6–7 days/week)"
    ]
    
    var body: some View {
        ZStack {
            Color(red: 0.94117647, green: 0.28627451, blue: 0.6)
                .ignoresSafeArea()
            
            VStack {
                Text("Enter your information:")
                    .font(.title)
                    .foregroundColor(.white)
                
                HStack {
                    Picker("Feet", selection: $feet) {
                        ForEach(3..<8) {
                            Text("\($0) ft")
                        }
                    }
                    .pickerStyle(WheelPickerStyle()) // Use WheelPickerStyle for a more fitting style
                    .padding()
                    
                    Picker("Inches", selection: $inches) {
                        ForEach(0..<12) {
                            Text("\($0) in")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding()
                }
                .padding(.bottom)
                
                HStack {
                    Picker("Weight (lbs)", selection: $weightInPounds) {
                        ForEach(50..<300) {
                            Text("\($0) lbs")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding()
                    
                    Picker("Age", selection: $age) {
                        ForEach(18..<100) {
                            Text("\($0) years")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding()
                }
                .padding(.bottom)
                
                Text("Select Activity Level:")
                    .foregroundColor(.white)
                    .padding()
                
                Slider(value: $selectedActivityLevel, in: 1...5, step: 1)
                    .padding()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
                VStack {
                    Text("Activity Level:")
                        .foregroundColor(.white)
                        .padding()
                    
                    Text("\(activityLevelDescriptions[Int(selectedActivityLevel) - 1])")
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer() // Add Spacer for additional space
                    
                    Button("Calculate") {
                        // Consider extracting this logic into a separate function for better readability
                        var femaleCalculations = FemaleCalculations(feet: feet, inches: inches, weightInPounds: weightInPounds, age: age)
                        femaleCalculations.calculateResults(activityLevel: Double(Int(selectedActivityLevel)))
                        bmrResult = femaleCalculations.bmrResult
                        bmiResult = femaleCalculations.bmiResult
                        amrResult = femaleCalculations.amrResult
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    // Group the result texts for better organization
                    Group {
                        Text("Calories burned naturally (BMR): \(bmrResult)")
                            .foregroundColor(.white)
                            .padding()
                         
                        Text("BMI: \(bmiResult)")
                            .foregroundColor(.white)
                            .padding()
                        
                        Text("Active Metabolic Rate (AMR): \(amrResult)")
                            .foregroundColor(.white)
                            .padding()
                    }
                    .padding()
                }
                .navigationBarTitle("Female Input")
            }
        }
    }
    
    struct FemaleView_Previews: PreviewProvider {
        static var previews: some View {
            FemaleView()
        }
    }
}
