//
//  ContentView.swift
//  WeatherAPI
//
//  Created by Serhii Malyshko on 01.03.2025.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var query: String = ""
    @State var cityCoordinates: CityCoordinatesResponse?
    @State var forecastResponse: ForecastResponse?
    
    var body: some View {
        VStack {
            Text("Please enter location").fontWeight(.bold)
            TextField("Enter location", text: $query)
                .padding()
                .background(Color.white)
                .presentationCornerRadius(5)
                .shadow(radius: 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
            Spacer()
            
            if let cityCoordinates = cityCoordinates {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Spacer()
                        Button {
                            self.query = ""
                            self.cityCoordinates = nil
                        } label: {
                            Text("Clear")
                        }
                        Spacer()
                    }
                    HStack {
                        Text("lat: \(cityCoordinates.lat)")
                        Spacer()
                    }
                    HStack {
                        Text("lon: \(cityCoordinates.lon)")
                        Spacer()
                    }
                    HStack {
                        Text("name: \(cityCoordinates.name)")
                        Spacer()
                    }.padding(.bottom, 10)
                }
                
                if let forecastResponse = forecastResponse {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Date: \(Date(timeIntervalSince1970: forecastResponse.dt))")
                            Spacer()
                        }
                        HStack {
                            Text("Temperature: \(forecastResponse.main.temp)")
                            Spacer()
                        }
                        HStack {
                            Text("Location: \(forecastResponse.name)")
                            Spacer()
                        }
                        Spacer()
                    }
                }
                
            }
        }
        .padding()
        .onChange(of: query) { oldValue, newValue in
            guard
                oldValue != newValue,
                newValue.count >= 0
            else {
                return
            }
            
            let requestCityCoordinatesPath = "https://api.openweathermap.org/geo/1.0/direct?q=\(newValue)&limit=1&appid=ef803d666bedf27ec281b6f759d94bfc&units=metric"
            guard let requestCityCoordinatesUrl = URL(string: requestCityCoordinatesPath) else {
                return
            }
            let requestCityCoordinates = URLRequest(url: requestCityCoordinatesUrl)
            Task {
                do {
                    let responseCityCoordinates = try await URLSession.shared.data(for: requestCityCoordinates)
                    
                    let cityCoordinatesData = responseCityCoordinates.0
                    
                    let cityCoordinatesResponse = try? JSONDecoder().decode(Array<CityCoordinatesResponse>.self, from: cityCoordinatesData)
                    
                    self.cityCoordinates = cityCoordinatesResponse?[0]
                    
                    let requestForecastPath = "https://api.openweathermap.org/data/2.5/weather?lat=\(cityCoordinates?.lat ?? 0)&lon=\(cityCoordinates?.lon ?? 0)&appid=ef803d666bedf27ec281b6f759d94bfc"
                    
                    guard let requestForecastUrl = URL(string: requestForecastPath) else {
                        return
                    }
                    
                    let requestForecast = URLRequest(url: requestForecastUrl)
                    
                    let responseForecast = try await URLSession.shared.data(for: requestForecast)
                    
                    let forecastData = responseForecast.0
                    
                    let forecastResponse = try? JSONDecoder().decode(ForecastResponse.self, from: forecastData)
                    
                    self.forecastResponse = forecastResponse
                } catch {
                    print("error: \(error)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
