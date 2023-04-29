//
//  WeatherInfoView.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 25.04.2023.
//

import SwiftUI

struct WeatherInfoView: View {
    var body: some View {
        VStack {
            Text("Antalya")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("25*C")
                .font(.system(size: 70))
                .foregroundColor(.white)
            Text("Partly Cloudy")
                .font(.title2)
                .foregroundColor(.white)
            HStack {
                Text("H: 29*")
                    .foregroundColor(.white)
                Text("L: 15*")
                    .foregroundColor(.white)
            }
        }.fontWeight(.bold)
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView()
    }
}
