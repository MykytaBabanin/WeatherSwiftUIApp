//
//  SwiftUIProjApp.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 29.07.2021.
//

import SwiftUI

@main
struct SwiftUIProjApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(weatherViewModel: WeatherViewModel())
        }
    }
}
