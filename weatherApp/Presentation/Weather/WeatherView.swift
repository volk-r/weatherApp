//
//  WeatherView.swift
//  weatherApp
//
//  Created by Roman Romanov on 17.05.2025.
//

import SwiftUI

struct WeatherView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var weatherManager: WeatherManager
    @StateObject var viewModel: WeatherViewModel
    
    // MARK: - Init
    
    init(viewModel: any WeatherViewModelProtocol = WeatherViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel as! WeatherViewModel)
    }
    
    // MARK: - body
    
    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.forecast.isEmpty {
                ProgressView()
            } else {
                header
                    .padding(.horizontal)
                
                List(viewModel.forecast, id: \.self) { forecastDay in
                    Group {
                        Text(forecastDay.date)
                        WeatherCardView(weatherDay: forecastDay.day)
                            .listRowSeparator(.hidden)
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
            }
        }
        .background{
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.blue.opacity(0.3),
                        Color.purple.opacity(0.2)
                    ]
                ),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        }
        .task {
            try? await weatherManager.loadWeather(for: "moscow")
            viewModel.setupWeather(with: weatherManager.weatherData)
        }
    }
}

extension WeatherView {
    
    // MARK: - header
    
    var header: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.getCityName())
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(viewModel.getCountryName())
                    .font(.headline)
            }
            Spacer()
        }
    }
}

#Preview {
    let weatherManager = WeatherManager()
    let viewModel = WeatherViewModel()
    
    WeatherView(viewModel: viewModel)
        .environmentObject(weatherManager)
        .onAppear {
            viewModel.setupMockWeather()
        }
}
