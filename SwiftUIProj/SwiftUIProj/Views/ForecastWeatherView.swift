//
//  ForecastWeatherView.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 25.04.2023.
//

import SwiftUI

struct ForecastWeatherView: View {
    let images = ["1","2","3","4","5","6","7","8"]
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(images, id: \.self) { imageName in
                    HStack {
                        Text("Today \(imageName)")
                            .fontWeight(.bold)
                            .padding()
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 30)
                        Text("1\(imageName)")
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct ForecastWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastWeatherView()
    }
}
