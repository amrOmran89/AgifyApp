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
            
            VStack {
                if let age = viewModel.age {
                    
                    HStack {
                        Text("\(text) is")
                            .font(.system(size: 24, weight: .light, design: .rounded))

                        Text(age.age, format: .number)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .italic()
                        
                        Text("years old")
                            .font(.system(size: 24, weight: .light, design: .rounded))
                    }
                }
                
                if let nationality = viewModel.nationality {
                    Text(nationality)
                        .font(.system(size: 18, weight: .light, design: .rounded))
                }
            }
            .frame(height: 60)
            
            Image("image")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                .padding()

            Spacer()
            
            HStack(spacing: 8) {
                
                HStack {
                    Menu {
                        ForEach(viewModel.countries) { country in
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
                    viewModel.getAgeAndNationality(from: text, countryCode: selectedCountry.code)
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
