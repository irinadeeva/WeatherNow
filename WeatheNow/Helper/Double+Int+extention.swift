//
//  Double+extention.swift
//  WeatheNow
//
//  Created by Irina Deeva on 30/10/24.
//

import Foundation

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }

    func notRoundDouble() -> String {
        return String(format: "%.3f", self/1000)
    }
}

extension Int {
    func roundToKilometer() -> String {
        return String(self/1000)
    }

    func toString() -> String {
        return String(self)
    }
}
