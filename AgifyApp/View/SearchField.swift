//
//  SearchField.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import SwiftUI

struct SearchField: View {
    
    @Binding var text: String
    @Binding var selectedCountry: Localization
    let countries: [Localization]
    let action: () -> Void
    
    var body: some View {
        HStack(spacing: 8) {
            
            HStack {
                Menu {
                    ForEach(countries) { country in
                        Button {
                            selectedCountry = country
                        } label: {
                            Text("\(country.flag) \(country.name)")
                        }

                    }
                } label: {
                    Text(selectedCountry.flag)
                }

                TextField("Your name...", text: $text)
                    .autocorrectionDisabled()
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black)
            }
         
            Button {
                action()
//                viewModel.getAgeAndNationality(from: text, countryCode: selectedCountry.code)
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 22))
                    .padding()
                    .foregroundStyle(.white)
                    .background(text.isEmpty ? Color.black.opacity(0.3) : Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .disabled(text.isEmpty)
        }
    }
}

#Preview {
    SearchField(
        text: .constant(""),
        selectedCountry: .constant(Localization(name: "Germany", code: "DE", flag: "🇩🇪")),
        countries: DataSource().countries
    ) { }
}
