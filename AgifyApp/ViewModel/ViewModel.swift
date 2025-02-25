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
    @Published var apiError: ApiError?
    
    private let apiService: ApiServicable
    private let dataSource = DataSource()
    
    init(apiService: any ApiServicable) {
        self.apiService = apiService
    }
    
    var countries: [Localization] {
        dataSource.countries.sorted(by: { $0.name > $1.name })
    }
    
    func getAgeAndNationality(from name: String, countryCode: String?) {
        Task {
            await getAge(from: name, countryCode: countryCode)
            await getNationality(from: name)
        }
    }
    
    func getAge(from name: String, countryCode: String?) async {
        do {
            let result = try await apiService.getAge(from: name, countryCode: countryCode)
            await MainActor.run {
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
        do {
            let result = try await apiService.getNationality(from: name)
            guard let mostProbabilityCountry = result.country.sorted(by: { $0.probability > $1.probability }).first else {
                return
            }
            
            if let countryName = countryName(from: mostProbabilityCountry.countryId) {
                await MainActor.run {
                    nationality = "\(name) is from \(countryName) with \(formatAsPercentage(mostProbabilityCountry.probability)) certainty"
                }
            }
            
        } catch {
            print(error)
        }
    }
    
    private func countryName(from countryCode: String) -> String? {
        Locale.current.localizedString(forRegionCode: countryCode)
    }
    
    private func formatAsPercentage(_ value: Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: value)) ?? "\(value * 100)%"
    }
}
