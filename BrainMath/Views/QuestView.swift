//
//  QuestView.swift
//  BrainMath
//
//  Created by G Zhen on 6/3/23.
//

import SwiftUI

struct QuestView: View {
    @AppStorage("questModeSetting")
    var settingsData = QuestionSettings().encode()!
    
    @State
    private var settings = QuestionSettings()
    
    @State
    private var questions: [MathQuestion] = []
    
    @State
    private var isGaming = false
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                print("Generating question set")
                generateQuestionSet(count: 10)
                isGaming.toggle()
            } label: {
                Text("Ready Go")
            }
            Spacer()
            BottomBannerAd()
            Divider()
        }
        .onAppear {
            if let settings = QuestionSettings.decode(data: settingsData) {
                self.settings = settings
            }
        }
        .fullScreenCover(isPresented: $isGaming, content: {
            QuestQuestionsView(isGaming: $isGaming, questions: $questions)
        })
    }
    
    private func generateQuestionSet(count: Int) {
        for _ in 0..<count {
            var question = MathQuestion()
            question.refresh(settings: settings)
            questions.append(question)
        }
        print("Questios Set is genterated, total question count is \(questions.count)")
    }
}

struct QuestView_Previews: PreviewProvider {
    static var previews: some View {
        QuestView()
    }
}
