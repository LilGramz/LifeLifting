//
//  preferenceView.swift
//  Life Lifting
//
//  Created by Lyah Morales on 12/17/23.
//

import Foundation
import SwiftUI

struct PreferenceView: View {
    
    @State private var gender = " "
    @State private var age = " "
    @State private var weight = " "
    @State private var heightFeet = " "
    @State private var heightInches = " "
    @State private var fitnessGoal = " "
    @State private var workoutSetting = " "
    @State private var fitnessLevel = " "
    @State private var daysPerWeek = " "
    
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Fitness Goals")) {
                    Picker("Fitness Goal", selection: $fitnessGoal) {
                        Text("Weight Loss").tag("Weight Loss")
                        Text("Muscle Gain").tag("Muscle Gain")
                        Text("Maintenance").tag("Maintenance")
                        Text("Flexibility").tag("Flexibility")
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 100)
                }
                
                Section(header: Text("Workout Setting")) {
                    Picker("Setting", selection: $workoutSetting) {
                        Text("Home").tag("Home")
                        Text("Gym").tag("Gym")
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 100)
                }
                
                Section(header: Text("Current Fitness Level")) {
                    Picker("Fitness Level", selection: $fitnessLevel) {
                        Text("Beginner").tag("Beginner")
                        Text("Intermediate").tag("Intermediate")
                        Text("Advanced").tag("Advanced")
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 100)
                }
                
                Section(header: Text("Days per Week")) {
                    Picker("Days per Week", selection: $daysPerWeek) {
                        Text("1").tag("1")
                        Text("2").tag("2")
                        Text("3").tag("3")
                        Text("4").tag("4")
                        Text("5").tag("5")
                        Text("6").tag("6")
                        Text("7").tag("7")
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 100)
                }
                
                NavigationLink(destination: InfoView().navigationBarBackButtonHidden(true)) {
                    Text("Next")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                }
                
            }
        }

    }
}


struct PreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceView()
    }
}
