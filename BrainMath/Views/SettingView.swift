//
//  SettingView.swift
//  BrainMath
//
//  Created by G Zhen on 6/3/23.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("trainModeSetting") var trainModeData = TrainModelSetting().encode()!
    @State private var trainModeSetting = TrainModelSetting()
    @State private var showError = false
    
    var body: some View {
        VStack {
            Section {
                Stepper(value: $trainModeSetting.maxValue, in: 5...100, step: 5) {
                    Text("Max: \(trainModeSetting.maxValue)")
                }
                Divider()
            } header: {
                Text("Train Mode")
                    .font(.headline)
            }
            .padding(.bottom)
            Spacer()
            Section {
                Text("Quest Mode Setting")
            } header: {
                Text("Quest Mode")
                    .font(.headline)
            }
            Spacer()
            saveBtn
        }
        .padding(.horizontal)
        .onAppear {
            if let setting = TrainModelSetting.decode(data: trainModeData) {
                trainModeSetting = setting
            }
        }
        .alert("Error", isPresented: $showError, actions: {}) {
            Text("Failed to save the settings, please try again")
        }

    }
    
    private var saveBtn: some View {
        Button {
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
