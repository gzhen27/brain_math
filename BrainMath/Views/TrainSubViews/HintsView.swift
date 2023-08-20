//
//  HintsView.swift
//  BrainMath
//
//  Created by G Zhen on 8/19/23.
//

import SwiftUI

struct HintsView: View {
    var body: some View {
        VStack {
            Text("Questions")
                .padding(.top)
                .font(.title)
            Group {
                Text("1 \(MathOperation.multiplication.rawValue) 2 = 2")
                Text("2 \(MathOperation.multiplication.rawValue) 1 = 2")
                Text("2 \(MathOperation.division.rawValue) 1 = 2")
                Text("2 \(MathOperation.division.rawValue) 2 = 1")
            }
            .padding()
            Spacer()
            BottomBannerAd()
        }
        .presentationDetents([.fraction(0.80)])
    }
}

struct HintsView_Previews: PreviewProvider {
    static var previews: some View {
        HintsView()
    }
}
