//
//  SettingComponentView.swift
//  BrainMath
//
//  Created by G Zhen on 8/1/23.
//

import SwiftUI

struct SettingComponentView: View {
    @Binding
    var isToggle: Bool
    
    @Binding
    var limit: Int
    
    let currentOperations: [MathOperation]
    let selectedOperation: MathOperation
    
    var body: some View {
        VStack {
            Toggle(isOn: $isToggle) {
                HStack(alignment: .center) {
                    Text(selectedOperation.rawValue)
                        .font(.headline)
                }
            }
            .disabled(currentOperations.count == 1 && currentOperations.contains(selectedOperation))
            if isToggle {
                Stepper(value: $limit, in: 5...100, step: 5) {
                    Text("Limit: \(limit)")
                        .font(.footnote)
                }
            }
            Divider()
                .padding(.horizontal)
        }
    }
}

struct SettingComponentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SettingComponentView(isToggle: .constant(true), limit: .constant(5), currentOperations: [MathOperation.multiplication], selectedOperation: .multiplication)
        }
        .padding()
    }
}
