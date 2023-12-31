//
//  LifeLiftingApp.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/17/23.
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
} 
@main
struct LifeLiftingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var authViewModel = AuthViewModel() // Initialize AuthViewModel as a StateObject

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(authViewModel) // Inject AuthViewModel as an environment object
        }
    }
}
