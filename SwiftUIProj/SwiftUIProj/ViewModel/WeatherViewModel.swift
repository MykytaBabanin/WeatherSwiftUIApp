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

enum RequestState {
    case loading
    case error(Error)
    case success
}

protocol WeatherSearchProtocol: ObservableObject {
    nonisolated var requestState: RequestState { get }
    nonisolated var dayForecast: CurrentWeather? { get }
    func fetchCurrentWeather(coordinate: CLLocationCoordinate2D) async
}

@MainActor
class WeatherViewModel: WeatherSearchProtocol {
    @Published var dayForecast: CurrentWeather?
    @Published var requestState: RequestState = .loading
    
    func fetchCurrentWeather(coordinate: CLLocationCoordinate2D) async {
        requestState = .loading
        guard let url = URL(string: "\(Secrets.baseUrl)/weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appid=\(Secrets.apiKey)") else { return }
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                requestState = .error(.badRequest)
                return
            }
            let currentWeather = try JSONDecoder().decode(CurrentWeather.self, from: data)
            self.dayForecast = currentWeather
            requestState = .success
        } catch(_) {
            requestState = .error(.backEndIssue)
        }
    }
}
