//
//  AnswerInputView.swift
//  BrainMath
//
//  Created by G Zhen on 7/14/23.
//

import SwiftUI

struct AnswerInputView: View {
    let answer: String
    
    var body: some View {
        HStack {
            Image(systemName: "pencil.line")
                .foregroundColor(.gray)
                .font(.headline)
            Text("\(answer.isEmpty ? "answer" : answer)")
                .opacity(answer.isEmpty ? 0.4 : 1)
            Spacer()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray, lineWidth: 1)
                .frame(height: 50)
        )
        .frame(width: 320)
    }
}

struct AnswerInputView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerInputView(answer: "123")
    }
}
