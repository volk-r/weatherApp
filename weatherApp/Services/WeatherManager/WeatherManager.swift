//
//  WeatherManager.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

final class WeatherManager: ObservableObject, WeatherManagerProtocol {
    
    // MARK: - Properties
    
    private let weatherService: WeatherServiceProtocol
    private(set) var weatherData: WeatherData?
    
    // MARK: - Initialization
    
    init(weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weatherService = weatherService
    }
    
    // MARK: - loadWeather
    
    func loadWeather(for city: String) async throws {
        do {
            if let loadedWeatherData = try await weatherService.loadWeather(for: city) {
                self.weatherData = loadedWeatherData
            }
        } catch {
            throw WeatherManagerError.weatherLoadingError
        }
    }
}
