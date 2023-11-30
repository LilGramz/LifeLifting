//
//  InfoView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/18/23.

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.28235294, green: 0.07843137, blue: 0.17647059)
                    .ignoresSafeArea()
                 
                VStack {
                    Text("Your Body, Your Rules, Your Life Lifting Journey.")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.96, green: 0.523, blue: 0.454))
                        .multilineTextAlignment(.center)
                    
                    Image("Home screen")
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                        .padding(.all)
                    
                    HStack {
                        NavigationLink(destination: MaleView()) {
                            Text("Male")
                                .frame(width: 150, height: 40) // Adjust the size as needed
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        NavigationLink(destination: FemaleView()) {
                            Text("Female")
                                .frame(width: 150, height: 40) // Adjust the size as needed
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Gender Choice")
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
