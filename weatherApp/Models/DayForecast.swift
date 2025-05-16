//
//  DayForecast.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

struct DayForecast: Codable, Sendable {
    let avgtempC: Double
    let maxwindKph: Double
    let avghumidity: Int
    let condition: Condition
    
    private enum CodingKeys: String, CodingKey {
        case avgtempC = "avgtemp_c"
        case maxwindKph = "maxwind_kph"
        case avghumidity
        case condition
    }
}
