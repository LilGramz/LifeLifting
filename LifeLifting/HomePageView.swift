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
                Text("Welcome!")
                    .foregroundColor(.softPeach)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()

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
                .cornerRadius(15)
                .padding()

                Spacer()

                Spacer()

                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }

    func tapLeft() {
        if currentImageIndex > 0 {
            currentImageIndex -= 1
        }
    }

    func tapRight() {
        if currentImageIndex < 7 {
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
