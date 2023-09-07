//
//  MathQuestion.swift
//  BrainMath
//
//  Created by G Zhen on 7/13/23.
//

import SwiftUI

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
    
    // return an array of hints for this question.
    var questionDescriptions: [String] {
        generateHints()
    }
    
    func generateHints() -> [String] {
        var hints: [String] = []
        
        switch operation {
        case .addition:
            hints.append("\(second) \(MathOperation.addition.rawValue) \(first) = \(answer)")
            hints.append("\(answer) \(MathOperation.subtraction.rawValue) \(first) = \(second)")
            hints.append("\(answer) \(MathOperation.subtraction.rawValue) \(second) = \(first)")
        case .subtraction:
            hints.append("\(first) \(MathOperation.addition.rawValue) \(second) = \(answer)")
            hints.append("\(second) \(MathOperation.addition.rawValue) \(first) = \(answer)")
            hints.append("\(answer) \(MathOperation.subtraction.rawValue) \(second) = \(first)")
        case .multiplication:
            hints.append("\(second) \(MathOperation.multiplication.rawValue) \(first) = \(answer)")
            hints.append("\(answer) \(MathOperation.division.rawValue) \(first) = \(second)")
            hints.append("\(answer) \(MathOperation.division.rawValue) \(second) = \(first)")
        case .division:
            hints.append("\(first) \(MathOperation.multiplication.rawValue) \(second) = \(answer)")
            hints.append("\(second) \(MathOperation.multiplication.rawValue) \(first) = \(answer)")
            hints.append("\(answer) \(MathOperation.division.rawValue) \(second) = \(first)")
        }
        
        return hints
    }
    
    mutating func refresh(settings: QuestionSettings) {
        let params = generateQuestionParams(settings: settings)
        if paramsValidate(params) {
            updateQuestion(params: params)
        } else {
            refresh(settings: settings)
        }
    }
    
    func checkAnswer(_ guess: String) -> Bool {
        if guess == hiddenValue { return true }
        if operation == .multiplication && hiddenIndex == 0 && second == 0 && answer == 0 { return true }
        if operation == .multiplication && hiddenIndex == 1 && first == 0 && answer == 0 { return true }
        if operation == .division && hiddenIndex == 0 && second == 0 && answer == 0 { return true }
        return false
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
    
    private func paramsValidate(_ params: Params) -> Bool {
        if params.operation == .division && params.first == 0 {
            return false
        }
        return true
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
        let operations = settings.currentOperations()
        let index = generateInteger(limit: operations.count-1)
        return operations[index]
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
