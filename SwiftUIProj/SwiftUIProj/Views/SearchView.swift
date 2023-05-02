//
//  SearchView.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 02.05.2023.
//

import SwiftUI
import CoreLocation

struct SearchView: View {
    @State private var searchText = ""
    @StateObject private var searchResultsViewModel = SearchResultsViewModel()
    let weatherViewModel: any WeatherSearchProtocol

    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .font(.title)
                .fontDesign(.serif)
                .padding(.leading, 10)
                .textFieldStyle(.roundedBorder)
                .padding(100)
                .onChange(of: searchText) { cityName in
                    searchGeoFromCity(cityName: cityName) { (coordinates, error) in
                        if let coordinates = coordinates {
                            Task {
                                await weatherViewModel.fetchCurrentWeather(coordinate: coordinates)
                            }
                        }
                    }
                }
        }
    }
    private func searchGeoFromCity(cityName: String, completion: @escaping (CLLocationCoordinate2D?, CLError?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(cityName) { (placemarks, error) in
            guard let placemarks = placemarks, let placemark = placemarks.first, let location = placemark.location else {
                completion(nil, error as? CLError)
                return
            }
            
            let coordinates = location.coordinate
            completion(coordinates, nil)
        }
    }
}
