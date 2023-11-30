//
//  AccountSettingsView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/23/23.
//

import SwiftUI

struct AccountSettingsView: View {
    @State private var selectedTab: Tab = .person
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        NavigationView{
            
            
            VStack{
                Image(systemName: "person.crop.circle")
                
                Text("Hello, World!")
                
                ZStack {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Placeholder")/*@END_MENU_TOKEN@*/

                    
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
    AccountSettingsView()
}
