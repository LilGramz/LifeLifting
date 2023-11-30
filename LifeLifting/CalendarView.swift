//
//  CalendarView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/23/23.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedTab: Tab = .calendar_circle
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        NavigationView{
            VStack{
                ZStack {
                    Color(.dentureGlue)
                        .ignoresSafeArea()
                    
                    VStack{
                        
                        MultiDatePicker("Label", selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Set<DateComponents>>@*/.constant([])/*@END_MENU_TOKEN@*/)
                        
                        
                    }
                    
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
    CalendarView()
}
