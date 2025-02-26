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
    
    @Test func resetUI() {
        let viewModel = ViewModel(apiService: mockService)
        
        viewModel.age = Age(count: 100, name: "Mathew", age: 39)
        viewModel.nationality = "John is from USA"
        viewModel.gender = .male
        viewModel.apiError = nil
        
        viewModel.resetUI()
        
        #expect(viewModel.age == nil)
        #expect(viewModel.nationality == nil)
        #expect(viewModel.gender == .default)
        #expect(viewModel.apiError == nil)
    }
}
