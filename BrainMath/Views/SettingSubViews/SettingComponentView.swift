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
                Stepper(value: $limit, in: 5...getMax(), step: getStep()) {
                    Text("Limit: \(limit)")
                        .font(.footnote)
                }
            }
            Divider()
                .padding(.horizontal)
        }
    }
    
    private func getMax() -> Int {
        switch selectedOperation {
        case .addition, .subtraction:
            return 10000
        case .multiplication, .division:
            return 100
        }
    }
    
    private func getStep() -> Int {
        switch selectedOperation {
        case .addition, .subtraction:
            return 1000
        case .multiplication, .division:
            return 5
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
