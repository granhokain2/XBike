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
    @StateObject private var locationManager = LocationManager()
    @State private var isTimerPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                EmptyView() //GoogleMapView
                VStack {
                    Spacer()
                    TimerModalView(isPresented: $isTimerPresented)
                        .cornerRadius(20)
                        .padding(.bottom, 20)
                }
            }
            .navigationBarTitle("Current Ride", displayMode: .inline)
            .toolbarBackground(Color.orange, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isTimerPresented = true
                    }) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct MyProgressView: View {
    @State private var rides: [Ride] = []
    
    var body: some View {
        NavigationView {
            List(rides) { ride in
                VStack(alignment: .leading) {
                    Text("From: \(ride.startAddress) to \(ride.endAddress)")
                    Text("Duration: \(ride.duration) min, Distance: \(ride.distance) km")
                }
            }
            .navigationBarTitle("My Progress", displayMode: .inline)
            .toolbarBackground(Color.orange, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {}
            }
        }
    }
}
