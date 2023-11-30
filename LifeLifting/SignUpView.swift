//
//  SignUpView.swift
//  Life Lifting
//
//  Created by Lyah Morales
//
import SwiftUI
 
struct SignUpView: View {
    @State private var name = ""
    @State private var username = ""
    @State private var password = ""
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.94117647, green: 0.28627451, blue: 0.6)
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Full name", text: $name)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    NavigationLink("Next", destination: InfoView())
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: BackButton { /* Handle back button action if needed */ })
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
