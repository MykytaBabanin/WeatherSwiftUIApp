//
//  WeatherAdditionalInfoView.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 25.04.2023.
//

import SwiftUI

struct WeatherAdditionalInfoView: View {
    var body: some View {
        HStack {
            Text("Cloudy conditions from 1AM-9AM, with showers expected at 9AM")
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

struct WeatherAdditionalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherAdditionalInfoView()
    }
}
