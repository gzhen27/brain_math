//
//  TrainModelSetting.swift
//  BrainMath
//
//  Created by G Zhen on 6/10/23.
//

import Foundation

struct TrainModelSetting: Codable {
    var maxValue: Int = 5
    
    func encode() -> Data? {
        let encoder = JSONEncoder()
        if let encodedValue = try? encoder.encode(self) {
            return encodedValue
        } else {
            return nil
        }
    }
    
    static func decode(data: Data) -> TrainModelSetting? {
        let decoder = JSONDecoder()
        if let setting = try? decoder.decode(TrainModelSetting.self, from: data) {
            return setting
        } else {
            return nil
        }
    }
}
