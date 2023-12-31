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
    var amrResult: Double = 0
    
    private let activityLevelDescriptions = [
        "Sedentary (little or no exercise)",
        "Lightly active (exercise 1–3 days/week)",
        "Moderately active (exercise 3–5 days/week)",
        "Active (exercise 6–7 days/week)",
        "Very active (hard exercise 6–7 days/week)"
    ]
    
    mutating func calculateResults(activityLevel: Double) {
        let heightInMeters = convertToMeters(feet: feet, inches: inches)
        let heightInCentimeters = convertToCentimeters(feet: feet, inches: inches)
        
        // Convert weight to kilograms
        let weightInKg = Double(weightInPounds) * 0.453592
        
        // BMR Calculation
        let bmr = 655.1 + (9.563 * weightInKg) + (1.850 * heightInCentimeters) - (4.676 * Double(age))
        bmrResult = bmr.rounded()
        
        // BMI Calculation
        let bmi = weightInKg / (heightInMeters * heightInMeters)
        bmiResult = bmi.rounded()
        
        // AMR Calculation based on activity level
        switch activityLevel {
        case 1: amrResult = (bmr * 1.2).rounded() // Sedentary (little or no exercise)
        case 2: amrResult = (bmr * 1.375).rounded() // Lightly active (exercise 1–3 days/week)
        case 3: amrResult = (bmr * 1.55).rounded() // Moderately active (exercise 3–5 days/week)
        case 4: amrResult = (bmr * 1.725).rounded() // Active (exercise 6–7 days/week)
        case 5: amrResult = (bmr * 1.9).rounded() // Very active (hard exercise 6–7 days/week)
        default: amrResult = bmr.rounded()
        }
    }
    
    private func convertToMeters(feet: Int, inches: Int) -> Double {
        let feetInMeters = Double(feet) * 0.3048
        let inchesInMeters = Double(inches) * 0.0254
        return feetInMeters + inchesInMeters
    }
    
    private func convertToCentimeters(feet: Int, inches: Int) -> Double {
        let feetInCentimeters = Double(feet) * 30.48
        let inchesInCentimeters = Double(inches) * 2.54
        return feetInCentimeters + inchesInCentimeters
    }
}

