//
//  MathQuestion.swift
//  BrainMath
//
//  Created by G Zhen on 7/13/23.
//

import Foundation

struct MathQuestion {
    private(set) var first: Int = 1
    private(set) var second: Int = 1
    private(set) var answer: Int = 1
    private(set) var hiddenIndex: Int = 1
    private(set) var operation: MathOperation = .multiplication
    
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
    
    var questionDescription: String {
        switch operation {
        case .addition, .multiplication:
            return "\(first) \(operation.rawValue) \(second) = \(answer)"
        case .subtraction, .division:
            return "\(answer) \(operation.rawValue) \(first) = \(second)"
        }
    }
    
    mutating func refresh(settings: QuestionSettings) {
        let params = generateQuestionParams(settings: settings)
        updateQuestion(params: params)
    }
    
    private mutating func updateQuestion(params: Params) {
        self.first = params.first
        self.second = params.second
        self.hiddenIndex = params.hiddenIndex
        self.answer = params.answer
        self.operation = params.operation
    }
}

extension MathQuestion {
    private func generateQuestionParams(settings: QuestionSettings) -> Params {
        let operation = getRandomOperation(settings: settings)
        let maxValue = getMaxValue(settings: settings, operation: operation)
        let first = generateInteger(limit: maxValue)
        let second = generateInteger(limit: maxValue)
        let hiddenIndex = generateInteger(limit: 2)
        let answer = generateAnswer(first: first, second: second, operation: operation)
        return Params(first: first, second: second, answer: answer, hiddenIndex: hiddenIndex, operation: operation)
    }
    
    private func generateAnswer(first: Int, second: Int, operation: MathOperation) -> Int {
        switch operation {
        case .addition, .subtraction:
            return first + second
        case .multiplication, .division:
            return first * second
        }
    }
    
    private func getRandomOperation(settings: QuestionSettings) -> MathOperation {
        let operations = getAllOperations(settings: settings)
        let index = generateInteger(limit: operations.count-1)
        return operations[index]
    }
    
    private func getAllOperations(settings: QuestionSettings) -> [MathOperation] {
        var operations: [MathOperation] = []
        if settings.isMultiplication { operations.append(.multiplication) }
        if settings.isDivision { operations.append(.division) }
        if settings.isAddition { operations.append(.addition) }
        if settings.isSubstraction { operations.append(.subtraction) }
        return operations
    }
    
    private func getMaxValue(settings: QuestionSettings, operation: MathOperation) -> Int {
        switch operation {
        case .multiplication:
            return settings.multiplicationMax
        case .division:
            return settings.divisionMax
        case .addition:
            return settings.additionMax
        case .subtraction:
            return settings.substractionMax
        }
    }
    
    private func generateInteger(limit: Int) -> Int {
        return Int.random(in: 0...limit)
    }
}

extension MathQuestion {
    struct Params {
        let first: Int
        let second: Int
        let answer: Int
        let hiddenIndex: Int
        let operation: MathOperation
    }
}

enum MathOperation: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}
