//
//  ApiService.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import Foundation

protocol ApiServicable {
    func getAge(from name: String, countryCode: String?) async throws -> Age
    func getNationality(from name: String) async throws -> Nationality
    func getGender(from name: String) async throws -> Gender
}

final class ApiService: Networkable, ApiServicable {
    
    func getAge(from name: String, countryCode: String?) async throws -> Age {
        let baseUrl = "https://api.agify.io"
        var urlComponents = URLComponents(string: baseUrl)
        
        urlComponents?.queryItems = [.init(name: "name", value: name)]
        if let countryCode {
            urlComponents?.queryItems?.append(.init(name: "country_id", value: countryCode))
        }
        
        let result: Age = try await fetch(url: urlComponents?.url)
        return result
    }
    
    func getNationality(from name: String) async throws -> Nationality {
        let baseUrl = "https://api.nationalize.io"
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.queryItems = [.init(name: "name", value: name)]

        let result: Nationality = try await fetch(url: urlComponents?.url)
        return result
    }
    
    func getGender(from name: String) async throws -> Gender {
        let baseUrl = "https://api.genderize.io"
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.queryItems = [.init(name: "name", value: name)]

        let result: Gender = try await fetch(url: urlComponents?.url)
        return result
    }

}
