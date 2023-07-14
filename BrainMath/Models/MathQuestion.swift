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
    let operation: MathOperation
    
    init(operation: MathOperation) {
        self.first = MathQuestion.generateInteger(limit: 100)
        self.second = MathQuestion.generateInteger(limit: 100)
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
