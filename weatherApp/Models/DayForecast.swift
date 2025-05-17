//
//  DayForecast.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

struct DayForecast: Codable, Sendable, Hashable {
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
    
    static let mockData: [DayForecast] = [
        .init(
            avgtempC: 17.8,
            maxwindKph: 18.4,
            avghumidity: 55,
            condition: Condition(
                text: "Sunny",
                icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"
            )
        ),
        .init(
            avgtempC: 18.2,
            maxwindKph: 10.8,
            avghumidity: 70,
            condition: Condition(
                text: "Partly Cloudy",
                icon: "//cdn.weatherapi.com/weather/64x64/night/116.png"
            )
        )
    ]
}
