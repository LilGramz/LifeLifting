// AuthViewModel.swift
// Life Lifting
// Created by Lyah Morales on 12/6/23.

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: AppUser?
    
    // Add user data properties
    @Published var userFullName: String?
    @Published var userHeight: Double?
    @Published var userWeightPounds: Int?
    @Published var userWeightKG: Double?
    @Published var userEmail: String?
    @Published var userAge: Int?
    @Published var userBMI: Double?
    @Published var userBMR: Double?
    @Published var userAMR: Double?

    init() {
        self.userSession = Auth.auth().currentUser
        Task { await fetchUser() }
    }

    func signIn(withEmail email: String, password: String) async throws {
        // Implement sign-in logic here
    }

    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user

            // Store user data
            userFullName = fullName
            userEmail = email

            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            userSession = nil
            currentUser = nil
            clearUserData()
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }

    func deleteAccount() async {
        do {
            guard let user = Auth.auth().currentUser else { return }
            try await user.delete()
            userSession = nil
            currentUser = nil
            clearUserData()
        } catch {
            print("DEBUG: Failed to delete account with error \(error.localizedDescription)")
        }
    }

    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            self.currentUser = try snapshot.data(as: AppUser.self)
        } catch {
            print("DEBUG: Failed to fetch user with error \(error.localizedDescription)")
            // Handle the error (e.g., show an alert to the user or log it for debugging)
        }
    }

    private func clearUserData() {
        userFullName = nil
        userHeight = nil
        userWeightPounds = nil
        userWeightKG = nil
        userEmail = nil
        userAge = nil
        userBMI = nil
        userBMR = nil
        userAMR = nil
    }
}
