//
//  TrainView.swift
//  BrainMath
//
//  Created by G Zhen on 6/3/23.
//

import SwiftUI

struct TrainView: View {
    @AppStorage("trainModeSetting") var trainModeData = TrainModelSetting().encode()!
    @State private var trainModeSetting = TrainModelSetting()
    @State private var answer = ""
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                displayQuestion(x: "5", y: "?", answer: "9999", type: "+")
                    .padding(.vertical)
                displayUserInput(answer)
                Spacer()
                createKeyboard(height: geo.size.height*0.4, result: $answer)
                Spacer()
                displaySkipBtn()
                ZStack {
                    Rectangle()
                        .stroke(CustomColor.tintColor, lineWidth: 1)
                        .frame(width: 320, height: 50)
                    Text("Ad placement")
                }
                Divider()
            }
        }
        .padding(.horizontal)
        .onAppear {
            if let setting = TrainModelSetting.decode(data: trainModeData) {
                trainModeSetting = setting
            }
        }
    }
}

struct TrainView_Previews: PreviewProvider {
    static var previews: some View {
        TrainView()
    }
}
