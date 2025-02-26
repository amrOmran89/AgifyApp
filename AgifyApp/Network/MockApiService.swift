//
//  MockApiService.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import Foundation

class MockApiService: ApiServicable {
    
    func getAge(from name: String, countryCode: String?) async throws -> Age {
        Age(count: 1, name: "John", age: 44)
    }
    
    func getNationality(from name: String) async throws -> Nationality {
        Nationality(
            count: 1,
            name: "Marc",
            country: [
                .init(countryId: "GB", probability: 0.2),
                .init(countryId: "US", probability: 0.3),
            ]
        )
    }
    
    func getGender(from name: String) async throws -> Gender {
        Gender(count: 1, name: "Jack", gender: .male, probability: 0.9)
    }
}
