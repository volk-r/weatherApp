//
//  WeatherService.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

actor WeatherService: WeatherServiceProtocol {
    
    // MARK: - Properties
    
    private var cache: [String: WeatherData] = [:]
    private let networkService: NetworkServiceProtocol
    private var activeDownloads: [String: Task<WeatherData?, Error>] = [:]
    
    // MARK: - Init

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - clearCache

    func clearCache() async {
        cache = [:]
    }
    
    // MARK: - loadWeather
    
    func loadWeather(for city: String) async throws -> WeatherData? {
        if let weatherData = cache[city] {
            return weatherData
        }
        
        if let existingDownload = activeDownloads[city] {
            return try await existingDownload.value
        }
        
        let downloadTask = Task<WeatherData?, Error> { [weak self] in
            let request = WeatherRequest(city: city)
            return try await self?.networkService.send(request: request)
        }

        activeDownloads[city] = downloadTask
        let weatherData = try await downloadTask.value
        
        if let weatherData = weatherData {
            cache[city] = weatherData
        }
        
        activeDownloads.removeValue(forKey: city)
        
        return weatherData
    }
}
