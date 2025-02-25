//
//  ContentView.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = ""
    @State private var selectedCountry = Localization(name: "All", code: nil, flag: "🌍")

    @StateObject private var viewModel: ViewModel
    
    init() {
        self._viewModel = StateObject(wrappedValue: ViewModel(apiService: ApiService()))
    }
        
    var body: some View {
        VStack {
            
            Text("Estimate the Age, Nationality of a Name")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.vertical)
            
            ResultView(
                error: viewModel.apiError,
                age: viewModel.age,
                nationality: viewModel.nationality,
                gender: viewModel.gender
            )
            .animation(.smooth, value: viewModel.gender)
            
            Spacer()
            
            SearchField(
                text: $text,
                selectedCountry: $selectedCountry,
                countries: viewModel.countries
            ) {
                viewModel.getAgeAndNationality(from: text, countryCode: selectedCountry.code)
                text = ""
            }
            .padding(.bottom, 20)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
