//
//  WeatherCardView.swift
//  weatherApp
//
//  Created by Roman Romanov on 17.05.2025.
//

import SwiftUI

struct WeatherCardView: View {
    
    let weatherDay: DayForecast
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https:\(weatherDay.condition.icon)"))
                .frame(width: 80, height: 80)
                .padding(.horizontal)
                .foregroundStyle(.indigo)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(weatherDay.condition.text)
                    .padding(.bottom, 2)
                
                Text("\(weatherDay.avgtempC.description) C'")
                    .padding(.bottom, 2)
                
                Group {
                    Text("Wind speed: \(weatherDay.maxwindKph.description) km/h")
                    Text("Humidity: \(weatherDay.avghumidity.description)%")
                }
                .font(.caption)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background {
            Color.indigo.opacity(0.3)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    Group {
        WeatherCardView(weatherDay: DayForecast.mockData.first!)
            .padding(.top)
        WeatherCardView(weatherDay: DayForecast.mockData.last!)
        Spacer()
    }
    .padding(.horizontal)
}
