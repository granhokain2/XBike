//
//  OnboardingView.swift
//  XBike
//
//  Created by Rafael Martins on 31/03/25.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    var body: some View {
        TabView {
            OnboardingPage(icon: "star.fill", title: "Simple to Use")
            OnboardingPage(icon: "map.fill", title: "Track Your Rides")
            OnboardingPage(icon: "chart.bar.fill", title: "See Your Progress")
        }
        .tabViewStyle(PageTabViewStyle())
        .overlay(
            Button("Get Started") {
                hasSeenOnboarding = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            , alignment: .bottom
        )
    }
}

struct OnboardingPage: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            Text(title)
                .font(.title)
                .padding()
        }
    }
}
