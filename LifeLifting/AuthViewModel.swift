//
 //  AuthViewModel.swift
 //  Life Lifting
 //
 //  Created by Lyah Morales on 12/6/23.
 // 


import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class AuthViewModel : ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    init() {
        self.userSession = Auth.auth().currentUser

        Task {
            await fetchUser()
        }
}

func signIn (withEmail email: String, password:String) async throws {

}

func createUser (withEmail email: String, password: String, fullName: String) async throws{
    do {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
        let user = User(id: result.user.uid, fullName: fullName, email: email)
        let encodedUser = try Firestore.Encoder().encode(user)
        try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        await fetchUser()

    } catch {
        print ("DEBUG: Failed to create user with error \(error.localizedDescription)")
    }
}

func signOut() {

}

func deleteAccount() {

}

func fetchUser() async{
    guard let uid = Auth.auth().currentUser?.uid else {return}
    guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
    self.currentUser = try? snapshot.data(as: User.self)

}
}
