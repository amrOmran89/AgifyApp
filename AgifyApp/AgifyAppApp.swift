//
//  AgifyAppApp.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import SwiftUI

@main
struct AgifyAppApp: App {

    @AppStorage("firstTimeOpen") var firstTimeOpen = true

    var body: some Scene {
        WindowGroup {
            if firstTimeOpen {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
