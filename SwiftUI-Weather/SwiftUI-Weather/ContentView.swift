//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Simon Bogutzky on 04.10.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue, Color("lightBlue")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }.padding(.bottom, 40)
                HStack(spacing: 20) {
                    WeatherDayView(
                        weekOfDay: "Tue",
                        imageName: "cloud.sun.fill",
                        temperature: 74)
                    WeatherDayView(
                        weekOfDay: "Wed",
                        imageName: "sun.max.fill",
                        temperature: 88)
                    WeatherDayView(
                        weekOfDay: "Thu",
                        imageName: "wind.snow",
                        temperature: 55)
                    WeatherDayView(
                        weekOfDay: "Fri",
                        imageName: "sunset.fill",
                        temperature: 60)
                    WeatherDayView(
                        weekOfDay: "Sat",
                        imageName: "snow",
                        temperature: 25)
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
    
    var weekOfDay: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(weekOfDay)
                .font(.system(size: 16, weight: .medium))
                .textCase(.uppercase)
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original).resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
