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
}
