//
//  WeatherInfoView.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 25.04.2023.
//

import SwiftUI

struct WeatherInfoView: View {
    var currentView: CurrentWeather?
    
    private var currentTemperature: Int {
        return kelvinToCelsius(currentView?.main.temp ?? 0)
    }
    
    private var currentDescription: String {
        if let currentWeather = currentView?.weather.first {
            return (currentWeather?.description ?? "").capitalized
        }
        return ""
    }
    
    private var currentMaxTemp: Int {
        return kelvinToCelsius(currentView?.main.temp_max ?? 0)
    }
    
    private var currentMinTemp: Int {
        return kelvinToCelsius(currentView?.main.temp_min ?? 0)
    }
    
    var body: some View {
        VStack {
            Text(currentView?.name ?? "")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("\(currentTemperature)°")
                .font(.system(size: 100))
                .foregroundColor(.white)
                .padding(.leading, 25)
            Text(currentDescription)
                .font(.title2)
                .foregroundColor(.white)
            HStack {
                HStack {
                    Image(systemName: "thermometer.sun.fill")
                        .foregroundColor(.red)
                    Text("\(currentMaxTemp)°")
                        .foregroundColor(.white)
                }
                HStack {
                    Image(systemName: "thermometer.snowflake")
                        .foregroundColor(.blue)
                    Text("\(currentMinTemp)°")
                        .foregroundColor(.white)
                }
            }
        }.fontWeight(.bold)
    }
    
    private func kelvinToCelsius(_ kelvin: Double) -> Int {
        return (kelvin - 273.15).toInt
    }
}

