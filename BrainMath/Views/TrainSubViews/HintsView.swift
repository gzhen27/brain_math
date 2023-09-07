//
//  HintsView.swift
//  BrainMath
//
//  Created by G Zhen on 8/19/23.
//

import SwiftUI

struct HintsView: View {
    var question: MathQuestion
    
    var body: some View {
        VStack {
            Text("Hints")
                .padding(.top)
                .font(.title)
            ForEach(question.questionDescriptions.sorted(), id: \.self) { desc in
                Text(desc)
            }
            .padding(8)
            Spacer()
            BottomBannerAd()
        }
        .presentationDetents([.fraction(0.80)])
    }
}

struct HintsView_Previews: PreviewProvider {
    static var previews: some View {
        HintsView(question: MathQuestion())
    }
}
