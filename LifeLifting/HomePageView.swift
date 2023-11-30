//
//  HomePageView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/23/23.
//

import SwiftUI

struct HomePageView: View {
    @State private var selectedTab: Tab = .house
    @State private var currentImageIndex = 0
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack {
            Color(.burgandyBG)
                .ignoresSafeArea()

            VStack {
                Text("Welcome Back!")
                    .foregroundColor(.softPeach)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()

                VStack(alignment: .center, spacing: 20) {
                    Image("Motivational-quote-\(currentImageIndex + 1)")
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                        .padding(.all)

                    HStack {
                        Spacer()

                        Button(action: tapLeft) {
                            Image(systemName: "arrowshape.left")
                                .font(.system(size: 32))
                                .foregroundColor(.burgandyBG)
                        }

                        Spacer()

                        Button(action: tapRight) {
                            Image(systemName: "arrowshape.right")
                                .font(.system(size: 32))
                                .foregroundColor(.burgandyBG)
                        }

                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .background(Rectangle().foregroundColor(.softPeach))
                .padding()

                Spacer()

                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }

    func tapLeft() {
        // Handle the tap left action
        if currentImageIndex > 0 {
            currentImageIndex -= 1
        }
    }

    func tapRight() {
        // Handle the tap right action
        if currentImageIndex < 7 { // Assuming there are 8 images (Motivational-quote-1 to Motivational-quote-8)
            currentImageIndex += 1
        }
    }
}

#if DEBUG
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
#endif
