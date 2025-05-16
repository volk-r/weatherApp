//
//  WeatherData.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

enum NetworkServiceError: Error {
    case urlRequestError
    case invalidResponse
    case httpStatusCode(Int)
    case urlSessionError(Error)
    case decodingError(Error)
    case unknown(Error)
}
