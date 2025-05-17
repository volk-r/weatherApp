//
//  Location.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

struct Location: Codable, Sendable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    
    static let mockLocation: Location = .init(
        name: "Moscow",
        region: "Moscow City",
        country: "Russia",
        lat: 55.7522,
        lon: 37.6156
    )
}
