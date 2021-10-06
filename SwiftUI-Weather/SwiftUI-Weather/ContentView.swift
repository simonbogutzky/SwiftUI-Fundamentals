//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Simon Bogutzky on 04.10.21.
//

import SwiftUI
import Combine

struct WeatherDayModel: Hashable, Codable {
    var day: String
    var imageName: String
    var minTemperature: Int
    var maxTemperature: Int
}

struct ContentView: View {
    
    @State private var isNight = false
    @State private var weatherDayModels: [WeatherDayModel] = []
    @State var cancellables = Set<AnyCancellable>()
    let publisher: AnyPublisher<[WeatherDayModel], Never> = fetchURL(URL(string: "https://dwd.api.proxy.bund.dev/v30/stationOverviewExtended?stationIds=E652")!)
        .share()
        .eraseToAnyPublisher()
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityNameView(cityName: "Nienburg (Weser)")
                if(weatherDayModels.count > 0) {
                    DayWeatherView(isNight: isNight, weatherDayModel: weatherDayModels[0])
                }
                HStack(spacing: 20) {
                    if(weatherDayModels.count > 4) {
                        ForEach(0...4, id: \.self) { index in
                            WeatherDayView(weatherDayModel: weatherDayModels[index])
                        }
                    }
                }
                Spacer()
                
                Button {
                    fetchWeatherData()
                } label: {
                    WeatherButton(title: "Aktualisieren", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Tageszeit ändern", textColor: .blue, backgroundColor: .white)
                }
                
                
                Spacer()
            }
        }.onAppear {
            fetchWeatherData()
        }
    }
    
    func fetchWeatherData() {
        publisher
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { (models: [WeatherDayModel]) in
                weatherDayModels = models
            })
            .store(in: &cancellables)
    }
    
    static func fetchURL(_ url: URL) -> AnyPublisher<[WeatherDayModel], Never> {
        URLSession.shared.dataTaskPublisher(for: url)
            .assertNoFailure("this shouldn't have happened")
            .flatMap({ result -> AnyPublisher<[WeatherDayModel], Never> in
                guard let urlResponse = result.response as? HTTPURLResponse, (200...299).contains(urlResponse.statusCode) else {
                    fatalError("We'll handle this later")
                }
                
                let json = try? JSONSerialization.jsonObject(with: result.data, options: []) as? [String: Dictionary<String, Any>]
                let days = json!["E652"]!["days"]! as! Array<Dictionary<String, Any>>
                print(days)
                return Just(days.map { day in
                    dayToWeatherDayModel(day: day)
                }).eraseToAnyPublisher()
            }).eraseToAnyPublisher()
    }
    
    static func dayToWeatherDayModel(day: Dictionary<String, Any>) -> WeatherDayModel {
        
        var imageName = "questionmark"
        let icon = day["icon"] as! Int
        switch icon {
            case 1: imageName = "sun.max.fill"
            case 2: imageName = "cloud.sun.fill"
            case 3: imageName = "cloud.sun.fill"
            case 4: imageName = "cloud.fill"
            case 5: imageName = "cloud.fog.fill"
            case 6: imageName = "cloud.fog.fill"
            case 7: imageName = "cloud.drizzle.fill"
            case 8: imageName = "cloud.rain.fill"
            case 9: imageName = "cloud.heavyrain.fill"
            case 10: imageName = "cloud.drizzle.fill"
            case 11: imageName = "cloud.heavyrain.fill"
            case 12: imageName = "cloud.sleet.fill"
            case 13: imageName = "cloud.sleet.fill"
            case 14: imageName = "cloud.snow.fill"
            case 15: imageName = "cloud.snow.fill"
            case 16: imageName = "cloud.snow.fill"
            case 17: imageName = "cloud.hail.fill"
            case 18: imageName = "cloud.sun.rain.fill"
            case 19: imageName = "cloud.sun.rain.fill"
            case 20: imageName = "cloud.sun.rain.fill"
            case 21: imageName = "cloud.sun.rain.fill"
            case 22: imageName = "cloud.sun.rain.fill"
            case 23: imageName = "cloud.sun.rain.fill"
            case 24: imageName = "cloud.sun.rain.fill"
            case 25: imageName = "cloud.sun.rain.fill"
            case 26: imageName = "cloud.bolt.fill"
            case 27: imageName = "cloud.bolt.rain.fill"
            case 28: imageName = "cloud.bolt.rain.fill"
            case 29: imageName = "cloud.bolt.rain.fill"
            case 30: imageName = "cloud.bolt.rain.fill"
            case 31: imageName = "wind"
            default:
                imageName = "questionmark"
        }
        print(icon)
        
        let minTemperature = Int(round(day["temperatureMin"] as! Double / 10.0))
        let maxTemperature = Int(round(day["temperatureMax"] as! Double / 10.0))
        
        
        let jsonDate = day["dayDate"] as! String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: jsonDate)
        let weekday = Calendar.current.component(.weekday, from: date!)
        let weekdays = ["So.", "Mo.", "Di.", "Mi.", "Do.", "Fr.", "Sa."]
        
        return WeatherDayModel(day: weekdays[weekday - 1], imageName: imageName, minTemperature: minTemperature, maxTemperature: maxTemperature)
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
            Text("\(weatherDayModel.minTemperature)° | \(weatherDayModel.maxTemperature)°")
                .font(.system(size: 12, weight: .medium))
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
    var isNight: Bool
    var weatherDayModel: WeatherDayModel
    
    var body: some View {
        VStack(spacing: 10) {
            if #available(iOS 15.0, *) {
                Image(systemName: isNight ? "moon.stars.fill" : weatherDayModel.imageName)
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
            } else {
                Image(systemName: isNight ? "moon.stars.fill" : weatherDayModel.imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
            }
            Text("\(weatherDayModel.minTemperature)° | \(weatherDayModel.maxTemperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}
