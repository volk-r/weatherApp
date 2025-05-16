//
//  weatherAppApp.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import SwiftUI

@main
struct weatherAppApp: App {
    
    @StateObject private var weatherManager = WeatherManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(weatherManager)
        }
    }
}
