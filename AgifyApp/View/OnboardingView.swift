//
//  OnboardingView.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import SwiftUI

struct OnboardingView: View {

    @AppStorage("firstTimeOpen") var firstTimeOpen = true
    
    var body: some View {
        VStack {
            Text("Welcome to Agify App")
                .font(.system(size: 30, weight: .bold))
                .padding(.bottom, 50)
            
            itemView(image: "age_group", title: "Predict the age", subTitle: "Predict the age of the person\nbased on their name")
                .padding(.vertical, 20)
            
            itemView(image: "nationality", title: "Predict the nationality", subTitle: "Predict the nationality of the person based on their name")
            
            itemView(image: "nationality", title: "Predict the nationality", subTitle: "Predict the nationality of the person based on their name")
            
            Spacer()
            
            Button {
                firstTimeOpen = false
            } label: {
                Text("Find your age")
                    .padding()
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }

        }
        .padding()
    }
    
    func itemView(image: String, title: String, subTitle: String) -> some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 140)
            
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .fontWeight(.bold)
                Text(subTitle)
            }
            
            Spacer()
        }
    }
}

#Preview {
    OnboardingView()
}
