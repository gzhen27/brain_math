//
//  TrainView.swift
//  BrainMath
//
//  Created by G Zhen on 6/3/23.
//

import SwiftUI

struct TrainView: View {
    @AppStorage("trainModeSetting")
    var trainModeData = TrainModelSetting().encode()!
    
    @State
    private var trainModeSetting = TrainModelSetting()
    
    @State
    private var question = MathQuestion(operation: .multiplication)
    
    @State
    private var answer = ""
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                DisplayQuestionView(question: question)
                    .padding(.top)
                AnswerInputView(answer: answer)
                Text(question.hiddenValue)
                Spacer()
                KeyboardView(question: $question, answer: $answer, height: geo.size.height*0.4, maxValue: trainModeSetting.maxValue)
                Spacer()
                SkipBtnView(question: $question, answer: $answer, maxValue: trainModeSetting.maxValue)
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
            if let setting = TrainModelSetting.decode(data: trainModeData) {
                trainModeSetting = setting
                question = MathQuestion(operation: .multiplication, maxValue: setting.maxValue)
            }
        }
    }
}

struct TrainView_Previews: PreviewProvider {
    static var previews: some View {
        TrainView()
    }
}
