//
//  WeatherViewModel.swift
//  weatherApp
//
//  Created by Roman Romanov on 17.05.2025.
//

import Foundation

final class WeatherViewModel: WeatherViewModelProtocol {
    
    // MARK: - Properties
    
    @Published private var location: Location? = nil
    @Published var forecast: [ForecastDay] = []
    
    // MARK: - setupWeather
    
    func setupWeather(with weatherData: WeatherData?) {
        guard let weatherData else { return }
        
        location = weatherData.location
        forecast = weatherData.forecast.forecastday
    }
    
    // MARK: - getCityName
    
    func getCityName() -> String {
        guard let location else { return "" }
        return "\(location.name)"
    }
    
    // MARK: - getCountryName
    
    func getCountryName() -> String {
        guard let location else { return "" }
        return location.country
    }
    
    // MARK: - setupMockWeather
    
    func setupMockWeather() {
        location = Location.mockLocation

        forecast = [
            ForecastDay(
                date: "2025-05-16",
                day: DayForecast.mockData[0]
            ),
            ForecastDay(
                date: "2025-05-16",
                day: DayForecast.mockData[1]
            )
        ]
    }
}
