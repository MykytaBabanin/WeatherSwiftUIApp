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
            Text("\(currentTemperature)")
                .font(.system(size: 70))
                .foregroundColor(.white)
            Text(currentDescription)
                .font(.title2)
                .foregroundColor(.white)
            HStack {
                Text("H: \(currentMaxTemp)")
                    .foregroundColor(.white)
                Text("L: \(currentMinTemp)")
                    .foregroundColor(.white)
            }
        }.fontWeight(.bold)
    }
    
    private func kelvinToCelsius(_ kelvin: Double) -> Int {
        return (kelvin - 273.15).toInt
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView(currentView: nil)
    }
}
