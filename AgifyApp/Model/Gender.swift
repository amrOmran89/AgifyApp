//
//  Gender.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import Foundation

struct Gender: Codable {
    let count: Int
    let name: String
    let gender: GenderType
    var probability: Float
}

enum GenderType: String, Codable {
    case male
    case female
}
