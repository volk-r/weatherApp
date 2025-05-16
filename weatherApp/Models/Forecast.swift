//
//  Forecast.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

struct Forecast: Codable, Sendable {
    let forecastday: [ForecastDay]
}
