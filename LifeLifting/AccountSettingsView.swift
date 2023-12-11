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
    @State private var bmrResult: Double = 0
    @State private var bmiResult: Double = 0
    @State private var amrResult: Double = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()

                Text("Hello, \(viewModel.userFullName ?? "User")!")
                    .font(.title)
                    .padding()

                Text("Email: \(viewModel.userEmail ?? "N/A")")
                    .padding()

                Text("Weight: \(viewModel.userWeightPounds ?? 0) lbs (\(viewModel.userWeightKG ?? 0) kg)")
                    .padding()

                // Additional user information
                Text("BMR: \(Int(bmrResult))")
                    .foregroundColor(.black)

                Text("BMI: \(Int(bmiResult))")
                    .foregroundColor(.black)

                Text("AMR: \(Int(amrResult))")
                    .foregroundColor(.black)

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
