//
//  SkipBtnView.swift
//  BrainMath
//
//  Created by G Zhen on 7/14/23.
//

import SwiftUI

struct SkipBtnView: View {
    @Binding var question: MathQuestion
    @Binding var answer: String
    
    var body: some View {
        return Button {
            question = MathQuestion(operation: .multiplication)
            answer = ""
        } label: {
            Text("Skip")
                .frame(width: 320, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(CustomColor.tintColor, lineWidth: 1)
                )
        }
    }
}

struct SkipBtnView_Previews: PreviewProvider {
    static var previews: some View {
        SkipBtnView(question: .constant(MathQuestion(operation: .multiplication)), answer: .constant("0"))
    }
}
