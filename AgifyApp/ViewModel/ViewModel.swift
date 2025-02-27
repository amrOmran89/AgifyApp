//
//  ViewModel.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var age: Age?
    @Published var nationality: String?
    @Published var gender: GenderType?
    @Published var apiError: ApiError?
    
    private let apiService: ApiServicable
    private let dataSource = DataSource()
    
    init(apiService: any ApiServicable) {
        self.apiService = apiService
    }
    
    var countries: [CountryCodeFlag] {
        dataSource.countries.sorted(by: { $0.name > $1.name })
    }
    
    func getAgeAndNationality(from name: String, countryCode: String?) {
        Task {
            await getAge(from: name, countryCode: countryCode)
            await getNationality(from: name)
            await getGender(from: name)
        }
    }
    
    func getAge(from name: String, countryCode: String?) async {
        do {
            let result = try await apiService.getAge(from: name, countryCode: countryCode)
            await MainActor.run {
                apiError = nil
                age = result
            }
        } catch {
            if let error = error as? ApiError {
                await MainActor.run {
                    apiError = error
                }
            }
            
            if error is DecodingError {
                await MainActor.run {
                    apiError = .decodingError
                }
            }
        }
    }
    
    func getNationality(from name: String) async {
        let result = try? await apiService.getNationality(from: name)
        guard let mostProbabilityCountry = result!.country.sorted(by: { $0.probability > $1.probability }).first else {
            return
        }
        
        if let countryName = mostProbabilityCountry.countryId.countryNameFromCode {
            await MainActor.run {
                nationality = "\(name) is from \(countryName) with \(mostProbabilityCountry.probability.formatAsPercentage) certainty"
            }
        }
    }
    
    func getGender(from name: String) async {
        let result = try? await apiService.getGender(from: name)
        if let genderResult = result?.gender {
            await MainActor.run {
                gender = genderResult
            }
        }
    }
}
