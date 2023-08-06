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
    
    let settings: QuestionSettings
    let height: CGFloat
    
    var body: some View {
        Grid(horizontalSpacing: 16, verticalSpacing: 16) {
            GridRowView(question: $question, answer: $answer, settings: settings, length: height/4, from: 1, to: 3)
            GridRowView(question: $question, answer: $answer, settings: settings, length: height/4, from: 4, to: 6)
            GridRowView(question: $question, answer: $answer, settings: settings, length: height/4, from: 7, to: 9)
            GridRowVariantView(question: $question, answer: $answer, settings: settings, length: height/4, from: 10, to: 12)
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(question: .constant(MathQuestion()), answer: .constant("10"), settings: QuestionSettings(), height: 300)
    }
}
