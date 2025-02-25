//
//  ApiError.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import Foundation

enum ApiError: Error {
    case badURL
    case responseNotFound
    case statusCode(Int)
}
