//
//  CalanderView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/23/23.
//

import SwiftUI

struct CalanderView: View {
    var body: some View {
        
        
        
        MultiDatePicker("Label", selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Set<DateComponents>>@*/.constant([])/*@END_MENU_TOKEN@*/)
        
        
        
        
        HStack{
            
            Image(systemName: "calendar.circle.fill")
            Image(systemName: "house")
            Image(systemName: "person")
            
        }
        
    }
}

#Preview {
    CalanderView()
}
