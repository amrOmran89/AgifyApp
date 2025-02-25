//
//  Nationality.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//


struct Nationality: Codable {
    let count: Int
    let name: String
    let country: [Country]
}

struct Country: Codable {
    let countryId: String
    let probability: Float
    
    enum CodingKeys: String, CodingKey {
        case probability
        case countryId = "country_id"
    }
}
