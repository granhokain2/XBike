//
//  RideModel.swift
//  XBike
//
//  Created by Rafael Martins on 31/03/25.
//

import Foundation

struct Ride: Identifiable {
    let id = UUID()
    let startAddress: String
    let endAddress: String
    let duration: Int
    let distance: Double
}
