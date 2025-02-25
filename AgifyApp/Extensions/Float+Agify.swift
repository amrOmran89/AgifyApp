//
//  Float+Agify.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import Foundation

extension Float {
    
    var formatAsPercentage: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "\(self * 100)%"
    }
}
