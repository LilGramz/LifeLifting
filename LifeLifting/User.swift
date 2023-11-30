//
 //  User.swift
 //  Life Lifting
 //
 //  Created by Lyah Morales on 12/5/23.
 //
 import Foundation

 struct User: Identifiable, Codable {
     let id: String
     let fullName: String
     let email: String

     var initials: String {
         let formatter = PersonNameComponentsFormatter()
         if let components = formatter.personNameComponents(from: fullName) {
             formatter.style = .abbreviated
             return formatter.string(from: components)
         }
         return ""
     }
 }
