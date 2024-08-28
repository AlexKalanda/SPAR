//
//  ExtensionDouble.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import Foundation

extension Double {
    func twoDigits() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = "."
        return String(formatter.string(from: number) ?? "")
    }
    func oneDigits() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        formatter.decimalSeparator = "."
        return String(formatter.string(from: number) ?? "")
    }
}
