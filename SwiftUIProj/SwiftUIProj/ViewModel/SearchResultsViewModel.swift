//
//  SearchResultsViewModel.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 02.05.2023.
//

import Foundation
import MapKit

@MainActor
class SearchResultsViewModel: ObservableObject {
    @Published var places = [PlaceViewModel]()
    
    func search(text: String, region: MKCoordinateRegion) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = text
        searchRequest.region = region
        
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, error in
            guard let response = response else {
                return
            }
            
            self.places = response.mapItems.map(PlaceViewModel.init)
        }
    }
}

struct PlaceViewModel: Identifiable {
    
    let id = UUID()
    private var mapItem: MKMapItem
    
    init(mapItem: MKMapItem) {
        self.mapItem = mapItem
    }
    
    var name: String {
        mapItem.name ?? ""
    }
}
