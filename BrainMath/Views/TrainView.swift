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
    
    @State
    private var isHint = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    DisplayQuestionView(question: question)
                        .padding(.top)
                    AnswerInputView(answer: answer)
                    Spacer()
                    KeyboardView(question: $question, answer: $answer, settings: settings, height: geo.size.height*0.4)
                    Spacer()
                    SkipBtnView(question: $question, answer: $answer, settings: settings)
                    BottomBannerAd()
                    Divider()
                }
                hintsIcon
            }
        }
        .padding(.horizontal)
        .onAppear {
            if let settings = QuestionSettings.decode(data: settingsData) {
                self.settings = settings
                if isFirstLoad || settings.hasChanged {
                    question = MathQuestion()
                    question.refresh(settings: settings)
                    isFirstLoad = false
                    self.settings.hasChanged = false
                    if let settingsData = self.settings.encode() {
                        self.settingsData = settingsData
                    }
                }
            }
        }
        .sheet(isPresented: $isHint) {
            HintsView(question: question)
        }
    }
    
    private var hintsIcon: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isHint.toggle()
                } label: {
                    Image(systemName: "\(isHint ? "book" : "book.closed")")
                        .font(.title2)
                        .animation(.easeOut, value: isHint)
                }
            }
            Spacer()
        }
    }
}

struct TrainView_Previews: PreviewProvider {
    static var previews: some View {
        TrainView()
    }
}
