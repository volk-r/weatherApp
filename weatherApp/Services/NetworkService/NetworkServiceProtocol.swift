//
//  WeatherData.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

protocol NetworkServiceProtocol: Sendable {
    func send<T: Sendable & Decodable>(request: NetworkRequest) async throws -> T?
}
