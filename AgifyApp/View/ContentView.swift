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
            
            Text("Your estimated Age based on your first Name is")
                .font(.system(size: 26, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.vertical)
            
            ResultView(
                error: viewModel.apiError,
                age: viewModel.age,
                name: text,
                nationality: viewModel.nationality
            )
            
            Spacer()
            
            SearchField(
                text: $text,
                selectedCountry: $selectedCountry,
                countries: viewModel.countries
            ) {
                viewModel.getAgeAndNationality(from: text, countryCode: selectedCountry.code)
            }
            .padding(.bottom, 20)
            
        }
        .padding()
        .onChange(of: text) { oldValue, newValue in
            if !oldValue.isEmpty && oldValue != newValue {
                viewModel.age = nil
                viewModel.nationality = nil
            }
        }
    }
}

#Preview {
    ContentView()
}
