//
//  Age.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import Foundation

struct Age: Codable {
    let count: Int
    let name: String
    let age: Int
    var countryId: String?
    
    enum CodingKeys: String, CodingKey {
        case count
        case name
        case age
        case countryId = "country_id"
    }
}
