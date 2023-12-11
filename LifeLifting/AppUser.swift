// AppUser.swift
// Life Lifting
// Created by Lyah Morales on 12/5/23.

import Foundation

struct AppUser: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    let bmi: Double
    let bmr: Double
    let amr: Double

    // Constants for keys
    private enum CodingKeys: String, CodingKey {
        case id, fullName, email, bmi, bmr, amr
    }

    // Computed property for initials
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }

    // Initializer for decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        fullName = try container.decode(String.self, forKey: .fullName)
        email = try container.decode(String.self, forKey: .email)
        bmi = try container.decode(Double.self, forKey: .bmi)
        bmr = try container.decode(Double.self, forKey: .bmr)
        amr = try container.decode(Double.self, forKey: .amr)
    }

    // Function for encoding (if needed)
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(fullName, forKey: .fullName)
        try container.encode(email, forKey: .email)
        try container.encode(bmi, forKey: .bmi)
        try container.encode(bmr, forKey: .bmr)
        try container.encode(amr, forKey: .amr)
    }
}
