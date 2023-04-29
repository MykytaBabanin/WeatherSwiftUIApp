//
//  WeatherViewModel.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 25.04.2023.
//

import Foundation
import CoreLocation

enum Error: String, CodingKey {
    case badRequest = "BadRequest"
    case redirection = "Redirection"
    case backEndIssue = "Server Error"
}

extension ContentView {
    @MainActor class WeatherViewModel: ObservableObject {
        @Published var dayForecast: CurrentWeather?
        @Published var isLoading = false
        @Published var localizedError = ""
        
        func fetchCurrentWeather(coordinate: CLLocationCoordinate2D) async {
            isLoading = true
            guard let url = URL(string: "\(Secrets.baseUrl)/weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appid=\(Secrets.apiKey)") else { return }
            let urlRequest = URLRequest(url: url)
            do {
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
                let currentWeather = try JSONDecoder().decode(CurrentWeather.self, from: data)
                self.dayForecast = currentWeather
            } catch(let error) {
                localizedError = error.localizedDescription
            }
            isLoading = false
        }
    }
}
