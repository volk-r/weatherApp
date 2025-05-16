//
//  WeatherRequest.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

// https://api.weatherapi.com/v1/forecast.json?q=moscow&days=5&key=YOUR_API_KEY

struct WeatherRequest: NetworkRequest {
    let city: String
    let days: Int = 5
    var endpoint: URL? {
        URL(string: "\(GlobalConstants.baseURL)/v1/forecast.json?q=\(city)&days=\(days)&key=\(GlobalConstants.apiKey)")
    }
    var dto: Dto?
}
