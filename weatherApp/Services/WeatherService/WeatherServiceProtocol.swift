//
//  WeatherServiceProtocol.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

protocol WeatherServiceProtocol: Sendable {
    func clearCache() async
    func loadWeather(for city: String) async throws -> WeatherData?
}
