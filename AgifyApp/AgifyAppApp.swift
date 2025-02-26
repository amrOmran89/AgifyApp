//
//  AgifyAppApp.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import SwiftUI

@main
struct AgifyAppApp: App {

    // this @State could be replaced with @AppStorge, but kept it for testing
    @State var showOnboarding = true

    var body: some Scene {
        WindowGroup {
            ContentView()
                .sheet(isPresented: $showOnboarding) {
                    OnboardingView(showOnboarding: $showOnboarding)
                        .interactiveDismissDisabled()
                }
        }
    }
}
