//
 //  SignUpView.swift
 //  Life Lifting
 //
 //  Created by Lyah Morales
 //
 import SwiftUI

 struct SignUpView: View {

     @State private var name = ""
     @State private var password = ""
     @State private var email = ""

     @Environment(\.dismiss) var dismiss
     @EnvironmentObject var viewModel: AuthViewModel

     var body: some View {
         NavigationView{

             //Login
             ZStack {

                 Color(.hotBarbiePink)
                     .ignoresSafeArea()
                     .blur(radius: 70)
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
                         .autocapitalization(.none)
                         .padding()
                         .frame(width: 300, height: 50)
                         .background(Color.black.opacity(0.05))
                         .cornerRadius(10)

                     SecureField("Password", text: $password)
                         .padding()
                         .frame(width: 300, height: 50)
                         .background(Color.black.opacity(0.05))
                         .cornerRadius(10)

                     //Next Button to InfoView
                     NavigationLink {
                         PreferenceView()
                             .navigationBarBackButtonHidden(true)
                     } label: {
                         Button {
                             Task{
                                try await viewModel.createUser(withEmail: email, password: password, fullName: name)
                             }

                         } label: {
                             HStack {
                                 Text("Next")
                             }
                         }
                         .foregroundColor(.white)
                         .frame(width: 300, height: 50)
                         .background(Color.blue)
                         .cornerRadius(10)
                         .padding(.top,24)
                     }

                     //Button to return to Log In screen
                     Button{
                         dismiss()
                     } label:{
                         HStack(spacing:3) {
                             Text("Already have an account?")
                                 .foregroundColor(.black)
                             Text("Sign In")
                                 .fontWeight(.bold)
                         }
                         .font(.system(size:14))
                     }

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
