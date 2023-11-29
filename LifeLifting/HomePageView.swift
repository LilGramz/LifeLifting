//
//  HomePageView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/23/23.
//

import SwiftUI

struct HomePageView: View {
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        ZStack{
            VStack {
                TabView(selection: $selectedTab){
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            Image(systemName: tab.rawValue)
                            Text("\(tab.rawValue.capitalized)")
                                .bold()
                                .animation(nil, value: selectedTab)
                        }
                        .tag(tab)
                    }
                }
            }
            
            Color(red: 0.28235294, green: 0.07843137, blue: 0.17647059)
                .ignoresSafeArea()
            VStack{
                
                Text( "Welcome Back")
                
                    .foregroundColor(Color(red: 1.01666667, green: 0.89166667, blue: 0.95416667))
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Text( "Welcome Back")
                
                    .foregroundColor(Color(red: 0.7833, green: 0.7208, blue: 0.9333))
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Text( "Welcome Back")
                
                    .foregroundColor(Color(red: 0.96, green: 0.523, blue: 0.454))
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                
                HStack{
                    Image("Motivational-quote-1")
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                        .padding(.all)
                    // put the picture ontop of a "box" with arrows to switch between images
                }
                
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        
        
    }
}

#Preview {
    HomePageView()
}
