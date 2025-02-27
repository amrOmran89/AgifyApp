//
//  AgifyAppTests.swift
//  AgifyAppTests
//
//  Created by Amr Omran on 25.02.25.
//

import Testing
@testable import AgifyApp

struct AgifyAppTests {

    let mockService = MockApiService()
    
    @Test func ageSuccess() async throws {
        let viewModel = ViewModel(apiService: mockService)
        await viewModel.getAge(from: "john", countryCode: nil)
        #expect(viewModel.age?.age == 44)
    }

    @Test func ageFailure() async throws {
        let viewModel = ViewModel(apiService: mockService)
        await viewModel.getAge(from: "john", countryCode: nil)
        #expect(viewModel.age?.age != 41)
    }
    
    @Test func nationalitySuccess() async throws {
        let viewModel = ViewModel(apiService: mockService)
        await viewModel.getNationality(from: "marc")
        #expect(viewModel.nationality == "marc is from United States with 30 % certainty")
    }
    
    @Test func nationalityFailure() async throws {
        let viewModel = ViewModel(apiService: mockService)
        await viewModel.getNationality(from: "marc")
        #expect(viewModel.nationality != "marc is not from United Kingdom with 20 % certainty")
    }
}
