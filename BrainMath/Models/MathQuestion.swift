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
        self.first = generateInteger(limit: 100)
        self.second = generateInteger(limit: 100)
        self.answer = generateAnswer(first: first, second: second, operation: operation)
        self.operation = operation
    }
}


enum MathOperation: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}
