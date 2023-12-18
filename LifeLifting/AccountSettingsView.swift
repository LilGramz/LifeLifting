//
//  AccountSettingsView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/23/23.
//

import SwiftUI

struct AccountSettingsView: View {
    @State private var selectedTab: Tab = .person
    @EnvironmentObject var viewModel: AuthViewModel

    // Additional user information
    @State private var fitnessGoal: String = ""
    @State private var workoutSetting: String = ""
    @State private var fitnessLevel: String = ""
    @State private var daysPerWeek: Int = 0
    @State private var bmiResult: Double = 0
    @State private var bmrResult: Double = 0
    @State private var amrResult: Double = 0
    @State private var heightInMeters: Double = 0
    @State private var weightInKg: Double = 0
    @State private var weightInPounds: Int = 0
    @State private var age: Int = 0
    @State private var selectedActivityLevel: Int = 1
    @State private var isMale: Bool = true // Assume male by default, change based on user input

    var body: some View {
        NavigationView {
            VStack {
                Color(.burgandyBG)
                    .ignoresSafeArea()
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()

                Text("Hello, \(viewModel.userFullName ?? "Justyce Graham")!")
                    .font(.title)
                    .padding()

                Text("Email: \(viewModel.userEmail ?? "Justycegraham@gmail.com")")
                    .padding()

                Text("Weight: \(viewModel.userWeightPounds ?? 0) lbs (\(viewModel.userWeightKG?.rounded() ?? 0) kg)")
                    .padding()

                // Display user input names
                Text("Fitness Goal: \(fitnessGoal)")
                Text("Workout Setting: \(workoutSetting)")
                Text("Fitness Level: \(fitnessLevel)")
                Text("Days Per Week: \(daysPerWeek)")

                // Display BMI, BMR, and AMR results
                Text("BMI Result: \(Int(bmiResult))")
                Text("BMR Result: \(Int(bmrResult))")
                Text("AMR Result: \(Int(amrResult))")

                Spacer()

                CustomTabBar(selectedTab: $selectedTab)
            }
            .onAppear {
                // Fetch or calculate additional user information when the view appears
                calculateMetrics()
            }
            .navigationBarTitle("Account Settings")
        }
    }

    private func calculateMetrics() {
        // Implement logic to calculate BMR, BMI, and AMR based on user data
        // For demonstration purposes, set some dummy values
        bmrResult = 1800
        bmiResult = 25
        amrResult = 2200
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
            .environmentObject(AuthViewModel())
    }
}
