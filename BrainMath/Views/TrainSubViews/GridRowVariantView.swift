//
//  GridRowVariantView.swift
//  BrainMath
//
//  Created by G Zhen on 7/14/23.
//

import SwiftUI

struct GridRowVariantView: View {
    @Binding
    var question: MathQuestion
    
    @Binding
    var answer: String
    
    let settings: QuestionSettings
    let length: CGFloat
    let from: Int
    let to: Int
    
    var body: some View {
        GridRow {
            ForEach(10..<13) { n in
                Button {
                    switch n  {
                    case 10:
                        answer = ""
                    case 11:
                        if (answer != "0") {
                            answer += "0"
                            if question.checkAnswer(answer) {
                                question.refresh(settings: settings)
                                answer = ""
                            }
                        }
                    case 12:
                        if (!answer.isEmpty) {
                            answer.removeLast()
                        }
                    default:
                        break
                    }
                } label: {
                    switch n  {
                    case 10:
                        Image(systemName: "eraser.line.dashed")
                            .frame(width: length, height: length)
                            .border(CustomColor.tintColor)
                    case 11:
                        Text("0")
                            .frame(width: length, height: length)
                            .border(CustomColor.tintColor)
                    case 12:
                        Image(systemName: "arrow.backward")
                            .frame(width: length, height: length)
                            .border(CustomColor.tintColor)
                    default:
                        Text("Error")
                    }
                }
            }
        }
    }
}

struct GridRowVariantView_Previews: PreviewProvider {
    static var previews: some View {
        GridRowVariantView(question: .constant(MathQuestion()), answer: .constant("123"), settings: QuestionSettings(), length: 20, from: 10, to: 12)
    }
}
