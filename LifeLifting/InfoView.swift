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
                Color(.burgandyBG)
                    .ignoresSafeArea()

                VStack {
                    Text("Choose your gender")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.softPeach))
                        .multilineTextAlignment(.center)

                    Image("Home screen")
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                        .padding(.all)

                    HStack {
                        NavigationLink(destination: MaleView()) {
                            Text("Male")
                                .frame(width: 150, height: 40)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding()

                        NavigationLink(destination: FemaleView()) {
                            Text("Female")
                                .frame(width: 150, height: 40)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
