//
//  FemaleView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/18/23.
//Color(red: 0.94117647, green: 0.28627451, blue: 0.6)
//

import SwiftUI

struct FemaleView: View {
    @State private var feet: Int = 5
    @State private var inches: Int = 9
    @State private var weightInPounds: Int = 150
    @State private var age: Int = 22
    @State private var selectedActivityLevel: Double = 1
    
    @State private var bmrResult: Double = 0
    @State private var bmiResult: Double = 0
    @State private var amrResult: Double = 0

    @State private var isNavigationActive: Bool = false

    private let activityLevelDescriptions = [
        "Sedentary (little or no exercise)",
        "Lightly active (exercise 1–3 days/week)",
        "Moderately active (exercise 3–5 days/week)",
        "Active (exercise 6–7 days/week)",
        "Very active (hard exercise 6–7 days/week)"
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Color(.hotBarbiePink)
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                    Text("Enter your information:")
                        .font(.title)
                        .foregroundColor(Color(.white))

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

                        Text("\(activityLevelDescriptions[Int(selectedActivityLevel) - 1])")
                            .foregroundColor(.white)
                            .padding()

                        NavigationLink(
                            destination: ResultView(bmrResult: bmrResult, bmiResult: bmiResult, amrResult: amrResult),
                            isActive: $isNavigationActive
                        ) {
                            EmptyView()
                        }
                        .hidden()

                        Button("Calculate") {
                            var femaleCalculations = FemaleCalculations(feet: feet, inches: inches, weightInPounds: weightInPounds, age: age)
                            femaleCalculations.calculateResults(activityLevel: Double(Int(selectedActivityLevel)))
                            bmrResult = femaleCalculations.bmrResult
                            bmiResult = femaleCalculations.bmiResult
                            amrResult = femaleCalculations.amrResult
                            isNavigationActive = true
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)

                        Group {
                            Text("BMR: \(Int(bmrResult))")
                                .foregroundColor(.white)
                                .font(.title2)

                            Text("BMI: \(Int(bmiResult))")
                                .foregroundColor(.white)
                                .font(.title2)

                            Text("AMR: \(Int(amrResult))")
                                .foregroundColor(.white)
                                .font(.title2)
                            NavigationLink(destination: HomePageView()) {
                                Text("Next")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.bottom)
                        .multilineTextAlignment(.center)
                    }
                   // .navigationBarTitle("Female Input")
                }
            }
        }
    }
}

struct FemaleView_Previews: PreviewProvider {
    static var previews: some View {
        FemaleView()
    }
}
