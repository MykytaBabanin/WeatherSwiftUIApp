//
//  ContentView.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 29.03.2023.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var weatherViewModel = WeatherViewModel()
    @ObservedObject private var locationManager = LocationManager()
    
    var body: some View {
        ZStack {
            Color.customBackgroundColor
                .ignoresSafeArea()
            if weatherViewModel.isLoading {
                LoadingView()
            } else if [Error.badRequest.rawValue,
                       Error.backEndIssue.rawValue,
                       Error.redirection.rawValue].contains(weatherViewModel.localizedError) {
                LoadingView()
                Text("Found an issue, please reload application")
            } else {
                WeatherInfoView(currentView: weatherViewModel.dayForecast)
            }
        }
        .onAppear(perform: {
            Task {
                await weatherViewModel.fetchCurrentWeather(coordinate: getCoordinate())
            }
        })
        .padding()
        .background(Color.customBackgroundColor)
    }
    
    private func getCoordinate() -> CLLocationCoordinate2D {
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
        return coordinate
    }
}

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .scaleEffect(2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
