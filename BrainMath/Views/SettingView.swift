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
    
    @AppStorage("questModeSetting")
    var questModeData = QuestionSettings().encode()!
    
    @State
    private var trainModeSetting = QuestionSettings()
    
    @State
    private var questModeSetting = QuestionSettings()
    
    @State
    private var showError = false
    
    @State
    private var settingType = "train"
    
    var body: some View {
        VStack {
            Picker("", selection: $settingType) {
                Text("Train").tag("train")
                Text("Quest").tag("quest")
            }
            .pickerStyle(.segmented)
            .padding()
            
            if settingType == "train" {
                SettingWidgetsView(settings: $trainModeSetting)
                .padding()
            }
            
            if settingType == "quest" {
                SettingWidgetsView(settings: $questModeSetting)
                .padding()
            }
            Spacer()
            saveBtn
        }
        .padding(.horizontal)
        .onAppear {
            if let setting = QuestionSettings.decode(data: trainModeData) {
                trainModeSetting = setting
            }
            
            if let setting = QuestionSettings.decode(data: questModeData) {
                questModeSetting = setting
            }
        }
        .alert("Error", isPresented: $showError, actions: {}) {
            Text("Failed to save your changes, please try again")
        }
    }
    
    private var saveBtn: some View {
        Button {
            trainModeSetting.hasChanged = true
            if let settingData = trainModeSetting.encode() {
                trainModeData = settingData
            } else {
                trainModeSetting.hasChanged = false
                showError = true
            }
            
            questModeSetting.hasChanged = true
            if let settingData = questModeSetting.encode() {
                questModeData = settingData
            } else {
                questModeSetting.hasChanged = false
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
