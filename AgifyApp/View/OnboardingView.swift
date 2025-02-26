//
//  OnboardingView.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var showOnboarding: Bool
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Welcome to Agify App")
                .font(.system(size: 30, weight: .bold))
                .padding(.top, 20)
            
            itemView(image: "age_group", title: "Predict the age", subTitle: "Predict the age of the person based on their name.")
            itemView(image: "nationality", title: "Predict the nationality", subTitle: "Predict the nationality of the person based on their name.")
            itemView(image: "gender", title: "Predict the gender", subTitle: "Predict the gender of the person based on their name.")
            
            Spacer()
            
            Button {
                showOnboarding = false
            } label: {
                Text("Find your age")
                    .padding()
                    .foregroundStyle(Color("ButtonLabelColor"))
                    .frame(maxWidth: .infinity)
                    .background(Color.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }

        }
        .padding()
    }
    
    private func itemView(image: String, title: String, subTitle: String) -> some View {
        HStack(alignment: .top, spacing: 16) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 140)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .fontWeight(.bold)
                
                Text(subTitle)
                    .font(.system(size: 15, weight: .light))
            }
            
            Spacer()
        }
    }
}

#Preview {
    OnboardingView(showOnboarding: .constant(true))
}
