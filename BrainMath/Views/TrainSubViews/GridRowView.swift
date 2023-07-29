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
    
    let from: Int
    let to: Int
    let length: CGFloat
    let maxValue: Int
    
    var body: some View {
        return GridRow {
            ForEach(from..<to+1, id: \.self) { n in
                Button {
                    if answer == "0" {
                        answer = ""
                    }
                    answer += "\(n)"
                    if answer == question.hiddenValue {
                        question = MathQuestion(operation: .multiplication, maxValue: maxValue)
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
        GridRowView(question: .constant(MathQuestion(operation: .multiplication, maxValue: 10)), answer: .constant("123"), from: 0, to: 0, length: 20, maxValue: 10)
    }
}
