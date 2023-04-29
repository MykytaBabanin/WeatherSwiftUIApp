//
//  WeatherDayView.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 25.04.2023.
//

import SwiftUI

struct WeatherDayView: View {
    let images = ["1","2","3","4","5","6","7","8"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(images, id: \.self) { imageName in
                    weatherCard(imageName: imageName)
                        .padding(.horizontal)
                }
            }
        }
    }
    
    private func weatherCard(imageName: String) -> some View {
        VStack {
            Text("\(imageName)AM")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding()
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
            Text("1\(imageName)")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct WeatherDayView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDayView()
    }
}
