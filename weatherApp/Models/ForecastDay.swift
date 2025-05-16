//
//  ForecastDay.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

struct ForecastDay: Codable, Sendable {
    let date: String
    let day: DayForecast
    
    private enum CodingKeys: String, CodingKey {
        case date
        case day
    }
}
