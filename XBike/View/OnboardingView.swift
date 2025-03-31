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
            OnboardingPage(icon: "star.fill", title: "Extremely simple to use.")
            OnboardingPage(icon: "map.fill", title: "Track your time and distance.")
            OnboardingPage(icon: "chart.bar.fill", title: "See your progress and challenge yourself!")
        }
        .background(Color.orange)
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
                .foregroundColor(.white)
                .padding()
            Text(title)
                .foregroundColor(.white)
                .font(.title)
                .padding()
        }
    }
}
