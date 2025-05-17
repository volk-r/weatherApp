//
//  AnimatedWeatherIcons.swift
//  weatherApp
//
//  Created by Roman Romanov on 17.05.2025.
//

import SwiftUI

struct AnimatedWeatherIconsView: View {
    
    // MARK: - Properties
    
    @State private var currentIcon: WeatherIcon = .sunny
    @State private var isVisible = false
    private let transitionInterval: TimeInterval = 2.0
    
    // MARK: - body
    
    var body: some View {
        VStack {
            weatherIcon
            weatherDescription
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(background)
        .onAppear {
            startAnimation()
        }
    }
}

extension AnimatedWeatherIconsView {
    
    // MARK: - weatherIcon
    
    private var weatherIcon: some View {
        Image(systemName: currentIcon.rawValue)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundColor(currentIcon.color)
            .opacity(isVisible ? 1 : 0)
            .scaleEffect(isVisible ? 1 : 0.8)
            .animation(
                .easeInOut(duration: 0.8),
                value: isVisible
            )
    }
    
    // MARK: - weatherDescription
    
    private var weatherDescription: some View {
        Text(currentIcon.description)
            .font(.title2)
            .foregroundColor(.white)
            .opacity(isVisible ? 1 : 0.5)
            .animation(.easeInOut(duration: 0.5), value: isVisible)
            .padding(.top, 20)
    }
    
    // MARK: - background
    
    private var background: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.5)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    // MARK: - startAnimation
    
    private func startAnimation() {
        withAnimation(.easeInOut(duration: 0.8)) {
            isVisible = true
        }
        
        Timer.scheduledTimer(withTimeInterval: transitionInterval, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                isVisible = false
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                currentIcon = WeatherIcon.random
                
                withAnimation(.easeInOut(duration: 0.8)) {
                    isVisible = true
                }
            }
        }
    }
}

#Preview {
    AnimatedWeatherIconsView()
        .ignoresSafeArea()
}
