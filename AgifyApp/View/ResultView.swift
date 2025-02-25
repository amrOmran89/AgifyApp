//
//  ResultView.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import SwiftUI

struct ResultView: View {
    
    @State private var image = "image"
    
    let error: ApiError?
    let age: Age?
    let name: String
    let nationality: String?
    
    var body: some View {
        VStack {
            VStack {
                if let error {
                    Group {
                        switch error {
                        case .responseNotFound, .badURL:
                            Text("Ops something wrong happend")
                                .font(.system(size: 40, weight: .black, design: .rounded))
                        case .statusCode(let code):
                            VStack {
                                Text(code, format: .number)
                                    .font(.system(size: 60, weight: .black, design: .rounded))
                                    .foregroundStyle(.red)
                                
                                Text("Too many requests")
                                    .font(.system(size: 24, weight: .light, design: .rounded))
                            }
                        case .decodingError:
                            Text("Enter a valid name")
                                .font(.system(size: 40, weight: .black, design: .rounded))
                        }
                    }
                    .padding(.bottom)
                } else {
                    Group {
                        if let age {
                            
                            HStack {
                                Text("\(name) is")
                                    .font(.system(size: 24, weight: .light, design: .rounded))

                                Text(age.age, format: .number)
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .italic()
                                
                                Text("years old")
                                    .font(.system(size: 24, weight: .light, design: .rounded))
                            }
                        }
                        
                        if let nationality {
                            Text(nationality)
                                .font(.system(size: 18, weight: .light, design: .rounded))
                        }
                    }
                    .padding(.bottom)
                }
            }
            .frame(height: 100)
            
            Image(image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                .padding()
                .animation(.smooth, value: image)
        }
        .onChange(of: error) { oldValue, newValue in
            if newValue != nil {
                generateRandomError()
            } else {
                image = "image"
            }
        }
    }
    
    func generateRandomError() {
        image = "error_\(Int.random(in: 1...4))"
    }
}

#Preview {
    ResultView(error: .statusCode(429), age: .init(count: 1, name: "John", age: 40), name: "John", nationality: "German")
}
