//
//  TrainView.swift
//  BrainMath
//
//  Created by G Zhen on 6/3/23.
//

import SwiftUI

struct TrainView: View {
    @AppStorage("trainModeSetting")
    var settingsData = QuestionSettings().encode()!
    
    @State
    private var settings = QuestionSettings()
    
    @State
    private var question = MathQuestion()
    
    @State
    private var answer = ""
    
    @State
    private var isFirstLoad = true
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                DisplayQuestionView(question: question)
                    .padding(.top)
                AnswerInputView(answer: answer)
                Text(question.questionDescription)
                Spacer()
                KeyboardView(question: $question, answer: $answer, settings: settings, height: geo.size.height*0.4)
                Spacer()
                SkipBtnView(question: $question, answer: $answer, settings: settings)
                ZStack {
                    Rectangle()
                        .stroke(CustomColor.tintColor, lineWidth: 1)
                        .frame(width: 320, height: 50)
                    Text("Ad placement")
                }
                Divider()
            }
        }
        .padding(.horizontal)
        .onAppear {
            if let settings = QuestionSettings.decode(data: settingsData) {
                self.settings = settings
                if isFirstLoad {
                    question = MathQuestion()
                    question.refresh(settings: settings)
                    isFirstLoad.toggle()
                }
            }
        }
    }
}

struct TrainView_Previews: PreviewProvider {
    static var previews: some View {
        TrainView()
    }
}
