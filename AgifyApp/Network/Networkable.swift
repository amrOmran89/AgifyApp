//
//  ApiService.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import Foundation

protocol Networkable {
    func fetch<T: Codable>(url: URL?) async throws -> T
}

extension Networkable {
    func fetch<T: Codable>(url: URL?) async throws -> T {
        guard let url else {
            throw ApiError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw ApiError.responseNotFound
        }
        
        guard 200...299 ~= response.statusCode else {
            throw ApiError.statusCode(response.statusCode)
        }
        
        let json = try JSONDecoder().decode(T.self, from: data)
        
        return json
    }

}
