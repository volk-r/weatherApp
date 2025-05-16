//
//  WeatherData.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

struct WeatherData: Codable, Sendable {
    let location: Location
    let forecast: Forecast
}
