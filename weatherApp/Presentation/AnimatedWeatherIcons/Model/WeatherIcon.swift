//
//  WeatherIcon.swift
//  weatherApp
//
//  Created by Roman Romanov on 17.05.2025.
//

import SwiftUI

enum WeatherIcon: String, CaseIterable {
    case sunny = "sun.max.fill"
    case cloudy = "cloud.fill"
    case rainy = "cloud.rain.fill"
    case partlyCloudy = "cloud.sun.fill"
    case thunderstorm = "cloud.bolt.fill"
    case snowy = "snowflake"
    case humid = "humidity.fill"
    case windy = "wind"
    case tornado = "tornado"
    case hot = "thermometer.sun.fill"
    
    var color: Color {
        switch self {
        case .sunny: return .yellow
        case .cloudy: return .gray
        case .rainy: return .blue
        case .partlyCloudy: return .orange
        case .thunderstorm: return .purple
        case .snowy: return .white
        case .humid: return .teal
        case .windy: return .mint
        case .tornado: return .indigo
        case .hot: return .red
        }
    }
    
    var description: String {
        switch self {
        case .sunny: return "Яркое солнце"
        case .cloudy: return "Облачно"
        case .rainy: return "Дождь"
        case .partlyCloudy: return "Переменная облачность"
        case .thunderstorm: return "Гроза"
        case .snowy: return "Снег"
        case .humid: return "Высокая влажность"
        case .windy: return "Ветрено"
        case .tornado: return "Ураган"
        case .hot: return "Жарко"
        }
    }
    
    static var random: WeatherIcon {
        WeatherIcon.allCases.randomElement() ?? .sunny
    }
}
