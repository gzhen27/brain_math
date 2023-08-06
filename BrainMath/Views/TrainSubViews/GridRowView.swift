//
//  GridRowView.swift
//  BrainMath
//
//  Created by G Zhen on 7/14/23.
//

import SwiftUI

struct GridRowView: View {
    @Binding
    var question: MathQuestion
    
    @Binding
    var answer: String
    
    let settings: QuestionSettings
    let length: CGFloat
    let from: Int
    let to: Int
    
    var body: some View {
        return GridRow {
            ForEach(from..<to+1, id: \.self) { n in
                Button {
                    if answer == "0" {
                        answer = ""
                    }
                    answer += "\(n)"
                    if question.checkAnswer(answer) {
                        question.refresh(settings: settings)
                        answer = ""
                    }
                } label: {
                    Text("\(n)")
                        .frame(width: length, height: length)
                        .border(CustomColor.tintColor)
                }
            }
        }
    }
}

struct GridRowView_Previews: PreviewProvider {
    static var previews: some View {
        GridRowView(question: .constant(MathQuestion()), answer: .constant("123"), settings: QuestionSettings(), length: 20, from: 0, to: 0)
    }
}
