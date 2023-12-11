//
//  ResultView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 12/9/23.
//

import SwiftUI

struct ResultView: View {
    let bmrResult: Double
    let bmiResult: Double
    let amrResult: Double

    var body: some View {
        ZStack {
            Color(.burgandyBG)
                .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Calculated Results:")
                    .font(.title)
                    .foregroundColor(.softPeach)
                    .padding()

                Text("BMR: \(Int(bmrResult))")
                    .foregroundColor(.softPeach)
                    .font(.title2)
                    .padding()

                Text("BMI: \(Int(bmiResult))")
                    .foregroundColor(.softPeach)
                    .font(.title2)
                    .padding()
                
                Text("AMR: \(Int(amrResult))")
                    .foregroundColor(.softPeach)
                    .font(.title2)
                    .padding()
                
                Spacer()
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(bmrResult: 1800, bmiResult: 25, amrResult: 2200)
    }
}
