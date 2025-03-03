//
//  ContentView.swift
//  ShowMeWeather
//
//  Created by Danylo Prudkyi on 03.03.2025.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var weatherData: WeatherData?
    var body: some View {
        VStack {
            if let weatherData = weatherData {
                Text("\(Int(weatherData.temperature))\(celsius)")
                    .font(.custom("", size: CGFloat(seventy)))
                    .padding()
                
                VStack {
                    Text("\(weatherData.locationName)")
                        .font(.title2)
                    Text("\(weatherData.condition)")
                        .font(.body).bold()
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                Text(codeLab)
                    .bold()
                    .padding()
                    .foregroundStyle(.gray)
                
            } else {
                ProgressView()
            }
        }
        .frame(width: CGFloat(threeHundred), height: CGFloat(threeHundred))
        .background(.ultraThinMaterial)
        .cornerRadius(CGFloat(twenty))
        .onAppear {
            locationManager.requestLocation()
        }
        .onReceive(locationManager.$location) { location in
            guard let location = location else { return }
            fetchWeatherData(for: location)
        }
    }
    
    private func fetchWeatherData(for location: CLLocation) {
        let apiKey = apiKey
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&units=metric&appid=\(apiKey)"
        
        guard let url = URL(string:  urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                
                DispatchQueue.main.async {
                    weatherData = WeatherData(locationName: weatherResponse.name, temperature: weatherResponse.main.temp, condition: weatherResponse.weather.first?.description ?? "")
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


#Preview {
    ContentView()
}
