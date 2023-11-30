//
//  BackButton.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/30/23.
//

import SwiftUI

struct BackButton: View {
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            Button(action: {
                action()
            }) {
                VStack {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    //.background(Color.blue)
                    .cornerRadius(8)
                }
            }
        }
    }
}



struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(action: {})
    }
}
