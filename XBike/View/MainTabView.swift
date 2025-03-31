//
//  MainTabView.swift
//  XBike
//
//  Created by Rafael Martins on 31/03/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CurrentRideView()
                .tabItem {
                    Label("Current Ride", systemImage: "bicycle")
                }
            MyProgressView()
                .tabItem {
                    Label("My Progress", systemImage: "list.bullet")
                }
        }
    }
}

struct CurrentRideView: View {
    
    var body: some View {
        VStack {
            Button("Tracking") {
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct MyProgressView: View {
    @State private var rides: [Ride] = []
    
    var body: some View {
        List(rides) { ride in
            VStack(alignment: .leading) {
                Text("From: \(ride.startAddress) to \(ride.endAddress)")
                Text("Duration: \(ride.duration) min, Distance: \(ride.distance) km")
            }
        }
    }
}
