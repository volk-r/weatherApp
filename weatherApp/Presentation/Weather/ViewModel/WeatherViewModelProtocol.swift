//
//  WeatherViewModelProtocol.swift
//  weatherApp
//
//  Created by Roman Romanov on 17.05.2025.
//

import Foundation

protocol WeatherViewModelProtocol: ObservableObject, AnyObject {
    var forecast: [ForecastDay] { get }
    func setupWeather(with: WeatherData?)
    func getCityName() -> String
    func getCountryName() -> String
}
