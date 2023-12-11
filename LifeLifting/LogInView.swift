//
 //  LoginView.swift
 //  Life Lifting
 // Created by Lyah Morales
 //

 import SwiftUI

 struct LoginView: View {

     @State private var email = ""
     @State private var password = ""

     @State private var showingLoginScreen = false

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
                             Text("Log In")
                                 .font(.largeTitle)
                                 .bold()
                                 .padding()

                             TextField("Email", text: $email)
                                 .padding()
                                 .frame(width: 300, height: 50)
                                 .background(Color.black.opacity(0.05))
                                 .cornerRadius(10)

                         SecureField("Password", text: $password)
                                 .padding()
                                 .frame(width: 300, height: 50)
                                 .background(Color.black.opacity(0.05))
                                 .cornerRadius(10)

                         Button {
                             Task {
                                 try await viewModel.signIn(withEmail: email, password: password)
                                         }
                                     } label: {
                                         HStack {
                                             Text("Sign In")
                                         }
                                     }
                                     .foregroundColor(.white)
                                     .frame(width: 300, height: 50)
                                     .background(Color.blue)
                                     .cornerRadius(10)

                         //Sign Up Button
                         NavigationLink {
                             SignUpView()
                                 .navigationBarBackButtonHidden(true)
                                 } label: {
                                     Text ("Don't have an account?")
                                         .foregroundColor(.black)

                                     Text ("Sign Up")
                                         .fontWeight(.bold)
                                     }

                                 }
                             }.navigationBarHidden(true)
                         }
                     }

                 }


         struct LoginView_Previews: PreviewProvider {
             static var previews: some View {
                 LoginView()
             }
         }
