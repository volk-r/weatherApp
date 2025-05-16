//
//  WeatherManagerProtocol.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

@MainActor
protocol WeatherManagerProtocol {
    var weatherData: WeatherData? { get }
    func loadWeather(for city: String) async throws
}
