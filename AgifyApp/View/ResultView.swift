//
//  ResultView.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import SwiftUI

struct ResultView: View {
        
    let error: ApiError?
    let age: Age?
    let nationality: String?
    let gender: GenderType?
    
    var body: some View {
        VStack {
            Image(imageText)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                .frame(width: 300)
            
            VStack {
                if let error {
                    VStack {
                        switch error {
                        case .responseNotFound, .badURL:
                            Text("Ops something wrong happend\nTry again later")
                                .font(.system(size: 20, weight: .light, design: .rounded))
                                .multilineTextAlignment(.center)
                        case .statusCode(_):
                            Text("Sorry!\nToo many requests\nTry again later")
                                .font(.system(size: 20, weight: .light, design: .rounded))
                                .multilineTextAlignment(.center)
                        case .decodingError:
                            Text("Sorry!\nYou entered an invalid name\nTry again")
                                .font(.system(size: 20, weight: .light, design: .rounded))
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.bottom)
                } else {
                    VStack {
                        if let age {
                            HStack {
                                Text("\(age.name) is")
                                    .font(.system(size: 20, weight: .light, design: .rounded))

                                Text(age.age, format: .number)
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .italic()
                                
                                Text("years old")
                                    .font(.system(size: 20, weight: .light, design: .rounded))
                            }
                        } else {
                            Text("Find your age from your name")
                                .font(.system(size: 20, weight: .light, design: .rounded))
                                .multilineTextAlignment(.center)
                                .padding(.top)
                        }
                        
                        if let nationality {
                            Text(nationality)
                                .font(.system(size: 18, weight: .light, design: .rounded))
                        }
                        
                    }
                    .padding(.bottom)
                }
            }
            .animation(.easeInOut, value: imageText)
        }
    }
    
    private var imageText: String {
        if error != nil {
            "error_image"
        } else {
            switch gender {
            case .male:
                "men_age_group"
            case .female:
                "women_age_group"
            case .none:
                "default_age_group"
            }
        }
    }
}

#Preview {
    ResultView(
        error: .badURL,
        age: .init(count: 1, name: "John", age: 40),
        nationality: "German",
        gender: .male
    )
}
