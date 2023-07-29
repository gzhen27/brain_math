//
//  MathQuestion.swift
//  BrainMath
//
//  Created by G Zhen on 7/13/23.
//

import Foundation

struct MathQuestion {
    let first: Int
    let second: Int
    let answer: Int
    let hiddenIndex: Int
    let operation: MathOperation
    
    var firstText: String {
        hiddenIndex == 0 ? "?" : "\(first)"
    }
    
    var secondText: String {
        hiddenIndex == 1 ? "?" : "\(second)"
    }
    
    var answerText: String {
        hiddenIndex == 2 ? "?" : "\(answer)"
    }
    
    var hiddenValue: String {
        switch hiddenIndex {
        case 0:
            return "\(first)"
        case 1:
            return "\(second)"
        case 2:
            return "\(answer)"
        default:
            return "Error"
        }
    }
    
    init(operation: MathOperation, maxValue: Int = 5) {
        self.first = MathQuestion.generateInteger(limit: maxValue)
        self.second = MathQuestion.generateInteger(limit: maxValue)
        self.hiddenIndex = MathQuestion.generateInteger(limit: 2)
        self.answer = MathQuestion.generateAnswer(first: first, second: second, operation: operation)
        self.operation = operation
    }
}

enum MathOperation: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

extension MathQuestion {
    static func generateInteger(limit: Int) -> Int {
        return Int.random(in: 0...limit)
    }

    static func generateAnswer(first: Int, second: Int, operation: MathOperation) -> Int {
        switch operation {
        case .addition:
            return first + second
        case .subtraction:
            return first - second
        case .multiplication:
            return first * second
        case .division:
            return first / second
        }
    }
}
