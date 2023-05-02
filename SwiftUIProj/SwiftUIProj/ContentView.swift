//
//  ContentView.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 29.03.2023.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var searchResultsViewModel = SearchResultsViewModel()
    @ObservedObject private var locationManager = LocationManager()
    @State private var searchText = ""
    
    let weatherViewModel: any WeatherSearchProtocol
    
    var body: some View {
        VStack {
            ZStack {
                Color.purpleBackgroundColor
                    .ignoresSafeArea()
                switch weatherViewModel.requestState {
                case .loading:
                    LoadingView()
                case .error(let error):
                    Text("Error fetching weather data \(error.rawValue)")
                case .success:
                    WeatherInfoView(currentView: weatherViewModel.dayForecast)
                }
            }
            .onAppear(perform: {
                Task {
                    await weatherViewModel.fetchCurrentWeather(coordinate: getCoordinates())
                }
            })
            SearchView(weatherViewModel: weatherViewModel)
                .dismissKeyboardOnTap()
            
        }
        .background(Color.blueBackgroundColor)
        .dismissKeyboardOnTap()
    }
    
    private func getCoordinates() -> CLLocationCoordinate2D {
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
        return coordinate
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(weatherViewModel: WeatherViewModel())
    }
}
