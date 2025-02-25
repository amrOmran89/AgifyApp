//
//  AgeResultView.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import SwiftUI

struct AgeResultView: View {
    let age: Age?
    let name: String
    let nationality: String?
    
    var body: some View {
        VStack {
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
        .frame(height: 60)
    }
}

#Preview {
    AgeResultView(age: .init(count: 1, name: "John", age: 40), name: "John", nationality: "German")
}
