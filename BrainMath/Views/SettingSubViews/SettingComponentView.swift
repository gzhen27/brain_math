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
    var maxValue: Int
    
    let text: String
    
    var body: some View {
        VStack {
            Toggle(isOn: $isToggle) {
                HStack(alignment: .center) {
                    Text(text)
                        .font(.headline)
                }
            }
            if isToggle {
                Stepper(value: $maxValue, in: 5...100, step: 5) {
                    Text("Max: \(maxValue)")
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
            SettingComponentView(isToggle: .constant(true), maxValue: .constant(5), text: "Button")
        }
        .padding()
    }
}
