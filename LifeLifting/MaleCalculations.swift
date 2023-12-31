// MaleCalculations.swift
// LifeLifting
//
// Created by Justyce Graham on 11/20/23.

import Foundation

struct MaleCalculations {
    var feet: Int
    var inches: Int
    var weightInPounds: Int
    var age: Int
    var gender: String // Add gender property
    
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
        // Convert height to centimeters
        let feetInMeters = Double(feet) * 0.3048
        let inchesInMeters = Double(inches) * 0.0254
        let heightInMeters = feetInMeters + inchesInMeters
        
        // Convert weight to kilograms
        let weightInKg = Double(weightInPounds) * 0.453592
        
        // BMR Calculation
        let bmr = 66.47 + (13.75 * weightInKg) + (5.003 * heightInMeters * 100) - (6.755 * Double(age))
        bmrResult = bmr.rounded()
        
        // BMI Calculation
        let bmi = weightInKg / (heightInMeters * heightInMeters)
        bmiResult = bmi.rounded()
        
        // New calculations based on gender
        let genderFactor: Double = (gender.lowercased() == "male") ? 1.0 : 0.9
        let adjustedBmr = bmr * genderFactor
        
        // AMR Calculation based on activity level
        switch activityLevel {
        case 1: amrResult = (adjustedBmr * 1.2).rounded() // Sedentary (little or no exercise)
        case 2: amrResult = (adjustedBmr * 1.375).rounded() // Lightly active (exercise 1–3 days/week)
        case 3: amrResult = (adjustedBmr * 1.55).rounded() // Moderately active (exercise 3–5 days/week)
        case 4: amrResult = (adjustedBmr * 1.725).rounded() // Active (exercise 6–7 days/week)
        case 5: amrResult = (adjustedBmr * 1.9).rounded() // Very active (hard exercise 6–7 days/week)
        default: amrResult = adjustedBmr.rounded()
        }
    }
}
