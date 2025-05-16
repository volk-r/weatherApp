//
//  ContentView.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var weatherManager: WeatherManager
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text(weatherManager.weatherData?.location.country ?? "aaaa")
        }
        .padding()
        .task {
            try? await weatherManager.loadWeather(for: "moscow")
        }
    }
}

#Preview {
    ContentView()
}
