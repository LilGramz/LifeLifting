//
//  HomePageView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/23/23.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        
        ZStack{
            Color(red: 0.28235294, green: 0.07843137, blue: 0.17647059)
                .ignoresSafeArea()
            VStack{
                Image("Logo")
                
                HStack{
                    Image("Motivational-quote-1")
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                        .padding(.all)
                    Image("Motivational-quote-2")
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                        .padding(.all)
                    
                }
            }
        }
        HStack{
            
            Image(systemName: "calendar.circle")
            Image(systemName: "house.fill")
            Image(systemName: "person")
            
        }
        
        
        
    }
}

#Preview {
    HomePageView()
}
