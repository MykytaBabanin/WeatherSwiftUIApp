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
        VStack {
            WeatherInfoView()
                .padding()
            WeatherAdditionalInfoView()
                .padding()
            Divider()
            WeatherDayView()
                .padding()
                .onAppear(perform: {
                    Task {
                        await weatherViewModel.retrieveCurrentWeather(for: "1", coordinate: getCoordinate())
                    }
                })
            Divider()
            ForecastWeatherView()
                .background(Color(.white))
                .cornerRadius(20)
                .padding(.top)
                .ignoresSafeArea()
        }
        .background(Color(red: 101 / 255.0, green: 78 / 255.0, blue: 146 / 255.0)
            .ignoresSafeArea())
    }
    
    private func getCoordinate() -> CLLocationCoordinate2D {
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
        return coordinate
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
