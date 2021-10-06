//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Simon Bogutzky on 04.10.21.
//

import SwiftUI

struct WeatherDayModel: Hashable {
    var day: String
    var imageName: String
    var temperature: Int
}

struct ContentView: View {
    
    @State private var isNight = false
    private var weatherDayModels = [
        WeatherDayModel(day: "Tue", imageName: "cloud.sun.fill", temperature: 74),
        WeatherDayModel(day: "Wed", imageName: "sun.max.fill", temperature: 88),
        WeatherDayModel(day: "Thu", imageName: "wind.snow", temperature: 55),
        WeatherDayModel(day: "Fri", imageName: "sunset.fill", temperature: 60),
        WeatherDayModel(day: "Sat", imageName: "snow", temperature: 25)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityNameView(cityName: "Cupertino, CA")
                DayWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                HStack(spacing: 20) {
                    ForEach(weatherDayModels, id: \.self) { weatherDayModel in
                        WeatherDayView(weatherDayModel: weatherDayModel)
                    }
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var weatherDayModel: WeatherDayModel
    
    var body: some View {
        VStack(spacing: 8) {
            Text(weatherDayModel.day)
                .font(.system(size: 16, weight: .medium))
                .textCase(.uppercase)
                .foregroundColor(.white)
            if #available(iOS 15.0, *) {
                Image(systemName: weatherDayModel.imageName)
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            } else {
                Image(systemName: weatherDayModel.imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
            Text("\(weatherDayModel.temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityNameView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct DayWeatherView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            if #available(iOS 15.0, *) {
                Image(systemName: imageName)
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
            } else {
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
            }
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}
