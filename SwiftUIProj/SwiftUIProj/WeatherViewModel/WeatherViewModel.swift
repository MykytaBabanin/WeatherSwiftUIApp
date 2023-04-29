//
//  WeatherViewModel.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 25.04.2023.
//

import Foundation
import CoreLocation

extension ContentView {
    @MainActor class WeatherViewModel: ObservableObject {
        @Published var currentWeatherArray: [CurrentWeather] = []
        
        func retrieveCurrentWeather(for cityId: String, coordinate: CLLocationCoordinate2D) async {
            guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appid=5fd295862c02837ed987a079e1d85a4c") else { return }
            let urlRequest = URLRequest(url: url)
            do {
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
                let currentWeather = try JSONDecoder().decode(CurrentWeather.self, from: data)
                self.currentWeatherArray.append(currentWeather)
            } catch(let error) {
                print(error)
            }
        }
    }
}


struct CurrentWeather: Codable {}
