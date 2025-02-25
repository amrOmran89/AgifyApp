//
//  AgifyAppTests.swift
//  AgifyAppTests
//
//  Created by Amr Omran on 25.02.25.
//

import Testing
@testable import AgifyApp

struct AgifyAppTests {

    @Test func ageSuccess() async throws {
        let mockService = MockApiService()
        let viewModel = ViewModel(apiService: mockService)
        
        await viewModel.getAge(from: "john", countryCode: nil)
        
        #expect(viewModel.age == 44)
    }

    @Test func ageFailure() async throws {
        let mockService = MockApiService()
        let viewModel = ViewModel(apiService: mockService)
        await viewModel.getAge(from: "john", countryCode: nil)

        #expect(viewModel.age != 41)
    }
}
