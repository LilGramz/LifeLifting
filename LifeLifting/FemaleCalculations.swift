//
//  FemaleCalculations.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/20/23.
//

import Foundation

struct FemaleCalculations {
    var feet: Int
    var inches: Int
    var weightInPounds: Int
    var age: Int

    var bmrResult: Double = 0
    var bmiResult: Double = 0

    mutating func calculateResults() {
        // Convert height to meters
        let feetInMeters = Double(feet) * 0.3048
        let inchesInMeters = Double(inches) * 0.0254
        let heightInMeters = feetInMeters + inchesInMeters
        
        // Convert height to centimeters
        let feetInCentimeters = Double(feet) * 30.48
        let inchesInCentimeters = Double(inches) * 2.54
        let heightInCentieters = feetInCentimeters + inchesInCentimeters

        // Convert weight to kilograms
        let weightInKg = Double(weightInPounds) * 0.453592
        
        // BMR Calculation
        let bmr = 655.1 + (9.563 * weightInKg) + (1.850 * heightInCentieters) - (4.676 * Double(age))
        bmrResult = bmr
        
        // BMI Calculation
        let bmi = weightInKg / (heightInMeters * heightInMeters)
        bmiResult = bmi
    }
}
