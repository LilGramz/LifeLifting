//
//  MaleView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/18/23.

import SwiftUI

struct MaleView: View {
    @State private var feet: Int = 5
    @State private var inches: Int = 9
    @State private var weightInPounds: Int = 150
    @State private var age: Int = 22
    @State private var selectedActivityLevel: Double = 1
    @State private var gender: String = "Male"
    
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
                Color(.burgandyBG)
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                    Text("Enter your information:")
                        .font(.title)
                        .foregroundColor(Color(.softPeach))

                    HStack {
                        Picker("Feet", selection: $feet) {
                            ForEach(3..<8) {
                                Text("\($0) ft")
                            }
                        }
                        .padding()
                        .background(Color.softPeach)
                        .cornerRadius(10)

                        Picker("Inches", selection: $inches) {
                            ForEach(0..<12) {
                                Text("\($0) in")
                            }
                        }
                        .padding()
                        .background(Color.softPeach)
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
                        .background(Color.softPeach)
                        .cornerRadius(10)

                        Picker("Age", selection: $age) {
                            ForEach(15..<50) {
                                Text("\($0) years")
                            }
                        }
                        .padding()
                        .background(Color.softPeach)
                        .cornerRadius(10)
                    }
                    .padding(.bottom)

                    Text("Select Activity Level:")
                        .foregroundColor(.softPeach)
                        .padding()

                    Slider(value: $selectedActivityLevel, in: 1...5, step: 1)
                        .padding()
                        .foregroundColor(.softPeach)
                        .cornerRadius(10)

                    VStack {
                        Text("Activity Level:")
                            .foregroundColor(.softPeach)

                        Text("\(activityLevelDescriptions[Int(selectedActivityLevel) - 1])")
                            .foregroundColor(.softPeach)
                            .padding()

                        NavigationLink(
                            destination: ResultView(bmrResult: bmrResult, bmiResult: bmiResult, amrResult: amrResult),
                            isActive: $isNavigationActive
                        ) {
                            EmptyView()
                        }
                        .hidden()

                        Button("Calculate") {
                            var maleCalculations = MaleCalculations(feet: feet, inches: inches, weightInPounds: weightInPounds, age: age, gender: gender)
                            maleCalculations.calculateResults(activityLevel: Double(Int(selectedActivityLevel)))
                            bmrResult = maleCalculations.bmrResult
                            bmiResult = maleCalculations.bmiResult
                            amrResult = maleCalculations.amrResult
                            isNavigationActive = true
                        }
                        .padding()
                        .foregroundColor(.softPeach)
                        .background(Color.blue)
                        .cornerRadius(10)

                        Group {
                            Text("BMR: \(Int(bmrResult))")
                                .foregroundColor(.softPeach)
                                .font(.title2)

                            Text("BMI: \(Int(bmiResult))")
                                .foregroundColor(.softPeach)
                                .font(.title2)

                            Text("AMR: \(Int(amrResult))")
                                .foregroundColor(.softPeach)
                                .font(.title2)
                            NavigationLink(destination: HomePageView()) {
                                Text("Next")
                                    .padding()
                                    .foregroundColor(.softPeach)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.bottom)
                        .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MaleView_Previews: PreviewProvider {
    static var previews: some View {
        MaleView()
    }
}
