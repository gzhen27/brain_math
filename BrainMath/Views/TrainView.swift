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
        VStack {
            HStack(alignment: .center) {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(CustomColor.tintColor, lineWidth: 2)
                        .frame(width: 60, height: 60)
                    Text("5")
                }
                Text(" X ")
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(CustomColor.tintColor, lineWidth: 2)
                        .frame(width: 60, height: 60)
                    Text("?")
                }
                Text(" = ")
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(CustomColor.tintColor, lineWidth: 2)
                        .frame(width: 60, height: 60)
                    Text("9999")
                }
            }
            .font(.system(size: 21))
            .padding()
            HStack {
                Image(systemName: "pencil.line")
                    .foregroundColor(.gray)
                    .font(.headline)
                TextField("answer", text: $answer)
                    .disabled(true)
            }
            .frame(width: 280)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))
            .padding()
            Grid(horizontalSpacing: 16, verticalSpacing: 16) {
                GridRow {
                    ForEach(1..<4) { n in
                        Button {
                            answer += "\(n)"
                        } label: {
                            Text("\(n)")
                                .frame(width: 80,height: 80)
                                .border(CustomColor.tintColor)
                                .cornerRadius(8)
                        }
                    }
                }
                GridRow {
                    ForEach(4..<7) { n in
                        Button {
                            answer += "\(n)"
                        } label: {
                            Text("\(n)")
                                .frame(width: 80,height: 80)
                                .border(CustomColor.tintColor)
                                .cornerRadius(8)
                        }
                    }
                }
                GridRow {
                    ForEach(7..<10) { n in
                        Button {
                            answer += "\(n)"
                        } label: {
                            Text("\(n)")
                                .frame(width: 80,height: 80)
                                .border(CustomColor.tintColor)
                                .cornerRadius(8)
                        }
                    }
                }
                GridRow {
                    ForEach(10..<13) { n in
                        Button {
                            switch n  {
                            case 10:
                                answer = ""
                            case 11:
                                if (!answer.isEmpty) {
                                    answer += "0"
                                }
                            case 12:
                                if (!answer.isEmpty) {
                                    answer.removeLast()
                                }
                            default:
                                break
                            }
                        } label: {
                            switch n  {
                            case 10:
                                Text("Clear")
                                    .frame(width: 80,height: 80)
                                    .border(CustomColor.tintColor)
                                    .cornerRadius(8)
                            case 11:
                                Text("0")
                                    .frame(width: 80,height: 80)
                                    .border(CustomColor.tintColor)
                                    .cornerRadius(8)
                            case 12:
                                Text("Back")
                                    .frame(width: 80,height: 80)
                                    .border(CustomColor.tintColor)
                                    .cornerRadius(8)
                            default:
                                Text("Error")
                            }
                        }
                    }
                }
            }
            .padding()
            Spacer()
            Button {
                
            } label: {
                Text("Check")
                    .frame(width: 320, height: 60)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(CustomColor.tintColor, lineWidth: 2)
                    )
            }
            Spacer()
            Divider()
        }
        .onAppear {
            if let setting = TrainModelSetting.decode(data: trainModeData) {
                trainModeSetting = setting
            }
        }
        .padding(.horizontal)
    }
}

struct TrainView_Previews: PreviewProvider {
    static var previews: some View {
        TrainView()
    }
}
