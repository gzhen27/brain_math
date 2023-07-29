//
//  KeyboardView.swift
//  BrainMath
//
//  Created by G Zhen on 7/14/23.
//

import SwiftUI

struct KeyboardView: View {
    @Binding
    var question: MathQuestion
    
    @Binding
    var answer: String
    
    let height: CGFloat
    let maxValue: Int
    
    var body: some View {
        Grid(horizontalSpacing: 16, verticalSpacing: 16) {
            GridRowView(question: $question, answer: $answer, from: 1, to: 3, length: height/4, maxValue: maxValue)
            GridRowView(question: $question, answer: $answer, from: 4, to: 6, length: height/4, maxValue: maxValue)
            GridRowView(question: $question, answer: $answer, from: 7, to: 9, length: height/4, maxValue: maxValue)
            GridRowVariantView(question: $question, answer: $answer, from: 10, to: 12, length: height/4, maxValue: maxValue)
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(question: .constant(MathQuestion(operation: .multiplication, maxValue: 10)), answer: .constant("123"), height: 300, maxValue: 10)
    }
}
