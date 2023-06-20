//
//  TrainViewHelper.swift
//  BrainMath
//
//  Created by G Zhen on 6/19/23.
//

import SwiftUI

func displayQuestion(x: String, y: String, answer: String, type: String) -> some View {
    return HStack(alignment: .center) {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .stroke(CustomColor.tintColor, lineWidth: 2)
                .frame(width: 60, height: 60)
            Text("\(x)")
        }
        Text(" \(type) ")
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .stroke(CustomColor.tintColor, lineWidth: 2)
                .frame(width: 60, height: 60)
            Text("\(y)")
        }
        Text(" = ")
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .stroke(CustomColor.tintColor, lineWidth: 2)
                .frame(width: 60, height: 60)
            Text("\(answer)")
        }
    }
}

func displayUserInput(_ input: String) -> some View {
    return HStack {
        Image(systemName: "pencil.line")
            .foregroundColor(.gray)
            .font(.headline)
        Text("\(input.isEmpty ? "answer" : input)")
            .opacity(input.isEmpty ? 0.4 : 1)
        Spacer()
    }
    .padding()
    .overlay(
        RoundedRectangle(cornerRadius: 4)
            .stroke(Color.gray, lineWidth: 1)
            .frame(height: 50)
    )
    .frame(width: 320)
}

func createKeyboard(height: CGFloat, result: Binding<String>) -> some View {
    return Grid(horizontalSpacing: 16, verticalSpacing: 16) {
        createGridRow(1, 3, length: height/4, result: result)
        createGridRow(4, 6, length: height/4, result: result)
        createGridRow(7, 9, length: height/4, result: result)
        createGridRowVariant(10, 12, length: height/4, result: result)
    }
}

func createGridRow(_ from: Int, _ to: Int, length: CGFloat, result: Binding<String>) -> some View {
    return GridRow {
        ForEach(from..<to+1, id: \.self) { n in
            Button {
                if result.wrappedValue == "0" {
                    result.wrappedValue = ""
                }
                result.wrappedValue += "\(n)"
            } label: {
                Text("\(n)")
                    .frame(width: length, height: length)
                    .border(CustomColor.tintColor)
            }
        }
    }
}

func createGridRowVariant(_ from: Int, _ to: Int, length: CGFloat, result: Binding<String>) -> some View {
    return GridRow {
        ForEach(10..<13) { n in
            Button {
                switch n  {
                case 10:
                    result.wrappedValue = ""
                case 11:
                    if (result.wrappedValue != "0") {
                        result.wrappedValue += "0"
                    }
                case 12:
                    if (!result.wrappedValue.isEmpty) {
                        result.wrappedValue.removeLast()
                    }
                default:
                    break
                }
            } label: {
                switch n  {
                case 10:
                    Image(systemName: "eraser.line.dashed")
                        .frame(width: length, height: length)
                        .border(CustomColor.tintColor)
                case 11:
                    Text("0")
                        .frame(width: length, height: length)
                        .border(CustomColor.tintColor)
                case 12:
                    Image(systemName: "arrow.backward")
                        .frame(width: length, height: length)
                        .border(CustomColor.tintColor)
                default:
                    Text("Error")
                }
            }
        }
    }
}

func displaySkipBtn() -> some View {
    return Button {
        
    } label: {
        Text("Skip")
            .frame(width: 320, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(CustomColor.tintColor, lineWidth: 1)
            )
    }
}
