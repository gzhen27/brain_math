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
}
