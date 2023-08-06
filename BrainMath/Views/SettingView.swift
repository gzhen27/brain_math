//
//  SettingView.swift
//  BrainMath
//
//  Created by G Zhen on 6/3/23.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("trainModeSetting")
    var trainModeData = QuestionSettings().encode()!
    
    @State
    private var trainModeSetting = QuestionSettings()
    
    @State
    private var showError = false
    
    var body: some View {
        VStack {
            VStack {
                SettingComponentView(isToggle: $trainModeSetting.isMultiplication, limit: $trainModeSetting.multiplicationMax, currentOperations
                                     : trainModeSetting.currentOperations(), selectedOperation: .multiplication)
                SettingComponentView(isToggle: $trainModeSetting.isDivision, limit: $trainModeSetting.divisionMax, currentOperations
                                     : trainModeSetting.currentOperations(), selectedOperation: .division)
                SettingComponentView(isToggle: $trainModeSetting.isAddition, limit: $trainModeSetting.additionMax, currentOperations
                                     : trainModeSetting.currentOperations(), selectedOperation: .addition)
                SettingComponentView(isToggle: $trainModeSetting.isSubstraction, limit: $trainModeSetting.substractionMax, currentOperations
                                     : trainModeSetting.currentOperations(), selectedOperation: .subtraction)
            }
            Spacer()
            saveBtn
        }
        .padding(.horizontal)
        .onAppear {
            if let setting = QuestionSettings.decode(data: trainModeData) {
                trainModeSetting = setting
            }
        }
        .alert("Error", isPresented: $showError, actions: {}) {
            Text("Failed to save the settings, please try again")
        }
    }
    
    private var saveBtn: some View {
        Button {
            trainModeSetting.hasChanged = true
            if let settingData = trainModeSetting.encode() {
                trainModeData = settingData
            } else {
                showError = true
            }
        } label: {
            Text("Save")
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(CustomColor.tintColor, lineWidth: 2)
                )
        }
        .padding(.bottom)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
