//
//  WeatherModel.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 29.04.2023.
//

import Foundation

struct CurrentWeather: Codable {
    let main: Main
    let name: String
    let weather: [Weather?]
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Codable {
    let main: String
    let description: String
    let icon: String
}
