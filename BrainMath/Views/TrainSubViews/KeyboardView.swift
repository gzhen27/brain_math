//
//  KeyboardView.swift
//  BrainMath
//
//  Created by G Zhen on 7/14/23.
//

import SwiftUI

struct KeyboardView: View {
    @Binding var answer: String
    
    let height: CGFloat
    
    var body: some View {
        Grid(horizontalSpacing: 16, verticalSpacing: 16) {
            GridRowView(answer: $answer, from: 1, to: 3, length: height/4)
            GridRowView(answer: $answer, from: 4, to: 6, length: height/4)
            GridRowView(answer: $answer, from: 7, to: 9, length: height/4)
            GridRowVariantView(answer: $answer, from: 10, to: 12, length: height/4)
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(answer: .constant("123"), height: 300)
    }
}
