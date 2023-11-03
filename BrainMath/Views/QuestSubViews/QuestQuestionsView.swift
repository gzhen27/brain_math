//
//  QuestQuestionsView.swift
//  BrainMath
//
//  Created by G Zhen on 11/2/23.
//

import SwiftUI

struct QuestQuestionsView: View {
    @Binding
    var isGaming: Bool
    
    @Binding
    var questions: [MathQuestion]
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                print("resetting questions and get score")
                questions = []
                isGaming.toggle()
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.title2)
            })
            .padding()
        }
        Spacer()
        Text("This is the Quest Question mode")
        Spacer()
    }
}

#Preview {
    var testQuestions: [MathQuestion] = []
    
    for _ in 0..<10 {
        let question = MathQuestion()
        testQuestions.append(question)
    }
    
    return QuestQuestionsView(isGaming: .constant(true), questions: .constant(testQuestions))
}
