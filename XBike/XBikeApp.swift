//
//  XBikeApp.swift
//  XBike
//
//  Created by Rafael Martins on 31/03/25.
//

import SwiftUI
import SwiftData

@main
struct XBikeApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                MainTabView()
            } else {
                OnboardingView()
            }
        }
    }
}
