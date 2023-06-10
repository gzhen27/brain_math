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
    
    var body: some View {
        VStack {
            Spacer()
            Text("Train View")
            Text("\(trainModeSetting.maxValue)")
            Spacer()
            Divider()
        }
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
