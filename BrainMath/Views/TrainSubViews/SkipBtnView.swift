//
//  SkipBtnView.swift
//  BrainMath
//
//  Created by G Zhen on 7/14/23.
//

import SwiftUI

struct SkipBtnView: View {
    @Binding
    var question: MathQuestion
    
    @Binding
    var answer: String
    
    let settings: QuestionSettings
    
    var body: some View {
        return Button {
            question.refresh(settings: settings)
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
        SkipBtnView(question: .constant(MathQuestion()), answer: .constant("0"), settings: QuestionSettings())
    }
}
