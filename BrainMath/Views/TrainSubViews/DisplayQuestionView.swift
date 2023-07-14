//
//  DisplayQuestionView.swift
//  BrainMath
//
//  Created by G Zhen on 7/14/23.
//

import SwiftUI

struct DisplayQuestionView: View {
    let question: MathQuestion
    
    var body: some View {
        HStack(alignment: .center) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(CustomColor.tintColor, lineWidth: 2)
                    .frame(width: 60, height: 60)
                Text("\(question.first)")
            }
            Text(" \(question.operation.rawValue) ")
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(CustomColor.tintColor, lineWidth: 2)
                    .frame(width: 60, height: 60)
                Text("\(question.second)")
            }
            Text(" = ")
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(CustomColor.tintColor, lineWidth: 2)
                    .frame(width: 60, height: 60)
                Text("\(question.answer)")
            }
        }
    }
}

struct DisplayQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayQuestionView(question: MathQuestion(operation: .multiplication))
    }
}
