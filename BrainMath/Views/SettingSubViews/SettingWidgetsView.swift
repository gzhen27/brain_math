//
//  SettingWidgetsView.swift
//  BrainMath
//
//  Created by G Zhen on 10/28/23.
//

import SwiftUI

struct SettingWidgetsView: View {
    @Binding var settings: QuestionSettings
    
    var body: some View {
        VStack {
            SettingComponentView(isToggle: $settings.isMultiplication, limit: $settings.multiplicationMax, currentOperations
                                 : settings.currentOperations(), selectedOperation: .multiplication)
            SettingComponentView(isToggle: $settings.isDivision, limit: $settings.divisionMax, currentOperations
                                 : settings.currentOperations(), selectedOperation: .division)
            SettingComponentView(isToggle: $settings.isAddition, limit: $settings.additionMax, currentOperations
                                 : settings.currentOperations(), selectedOperation: .addition)
            SettingComponentView(isToggle: $settings.isSubstraction, limit: $settings.substractionMax, currentOperations
                                 : settings.currentOperations(), selectedOperation: .subtraction)
        }
    }
}

//#Preview {
//    SettingWidgetsView()
//}
