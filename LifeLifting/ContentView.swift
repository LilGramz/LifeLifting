// ContentView.swift
// Life Lifting
// Created by Lyah Morales

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                HomePageView()
            } else {
                LoginView()
            }
        }
        .onChange(of: viewModel.userSession) { userSession, _ in
            if let _ = userSession {
                // User is signed in, navigate to the home page or a specific view
                // You might use a navigation link or navigation stack to push a new view
            } else {
                // User is signed out, navigate to the login view
                // You might use a navigation link or navigation stack to push a new view
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
