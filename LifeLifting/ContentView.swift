//
 //  ContentView.swift
 //  Life Lifting
 // Created by Lyah Morales
 //
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
     }}


         struct ContentView_Previews: PreviewProvider {
             static var previews: some View {
                 ContentView()
             }
         }
