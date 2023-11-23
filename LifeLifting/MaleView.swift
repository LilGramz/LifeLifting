//
//  MaleView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/18/23.

import SwiftUI

struct MaleView: View {
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
            Color(red: 0.28235294, green: 0.07843137, blue: 0.17647059)
                .ignoresSafeArea()
            
            VStack {
                Text("Enter your information:")
                    .font(.title)
                    .foregroundColor(.white)
                
                // Combine the two HStacks for better readability
                HStack {
                    Picker("Feet", selection: $feet) {
                        ForEach(3..<8) {
                            Text("\($0) ft")
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Picker("Inches", selection: $inches) {
                        ForEach(0..<12) {
                            Text("\($0) in")
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }
                .padding(.bottom)
                
                HStack {
                    Picker("Weight (lbs)", selection: $weightInPounds) {
                        ForEach(50..<300) {
                            Text("\($0) lbs")
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Picker("Age", selection: $age) {
                        ForEach(18..<100) {
                            Text("\($0) years")
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
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
                        var maleCalculations = MaleCalculations(feet: feet, inches: inches, weightInPounds: weightInPounds, age: age)
                        maleCalculations.calculateResults(activityLevel: Double(Int(selectedActivityLevel)))
                        bmrResult = maleCalculations.bmrResult
                        bmiResult = maleCalculations.bmiResult
                        amrResult = maleCalculations.amrResult
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
                .navigationBarTitle("Male Input")
            }
        }
    }
}

struct MaleView_Previews: PreviewProvider {
    static var previews: some View {
        MaleView()
    }
}
