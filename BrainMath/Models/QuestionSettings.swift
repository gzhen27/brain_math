//
//  QuestionSettings.swift
//  BrainMath
//
//  Created by G Zhen on 6/10/23.
//

import Foundation

struct QuestionSettings: Codable {
    var isMultiplication: Bool = true
    var isDivision: Bool = false
    var isAddition: Bool = false
    var isSubstraction: Bool = false
    
    var multiplicationMax: Int = 5
    var divisionMax: Int = 5
    var additionMax: Int = 100
    var substractionMax: Int = 100
    
    var hasChanged: Bool = false
    
    func encode() -> Data? {
        let encoder = JSONEncoder()
        if let encodedValue = try? encoder.encode(self) {
            return encodedValue
        } else {
            return nil
        }
    }
    
    static func decode(data: Data) -> QuestionSettings? {
        let decoder = JSONDecoder()
        if let setting = try? decoder.decode(QuestionSettings.self, from: data) {
            return setting
        } else {
            return nil
        }
    }
    
    func currentOperations() -> [MathOperation] {
        var operations: [MathOperation] = []
        if isMultiplication { operations.append(.multiplication) }
        if isDivision { operations.append(.division) }
        if isAddition { operations.append(.addition) }
        if isSubstraction { operations.append(.subtraction) }
        return operations
    }
}
