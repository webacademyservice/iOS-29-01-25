//
//  ContentView.swift
//  WeatherApp
//
//  Created by Denis Ostapiv on 25.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    @State var forecast: ForecastResponse?
    var body: some View {
        
        VStack {
            
            TextField("Ваше місто", text: $query)
                .textFieldStyle(.roundedBorder)
            Divider()
            if let forecast = forecast {
                List(forecast.list, id: \.dt) { forecast in // Вивід на екран погоди
                    HStack {
                        Text("\(Date(timeIntervalSince1970: forecast.dt))")
                        Text("\(forecast.main.temp) C")
                            .font(.title)
                    }
                }
            } else {
                Spacer()
                Image(systemName: "thermometer.medium")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Введіть ваше місто")
                Spacer()
            }
        }
        .padding()
        .onChange(of: query) { oldValue, newValue in // Зчитати запит юзера
            guard
                oldValue != newValue,
                newValue.count >= 4
            else {
                return
            }
            let requestPath = "https://api.openweathermap.org/data/2.5/forecast?q=\(newValue)&units=metric&appid=ccd3aefe7a8dbd27145dc40f24d374e8" // перетворити запит на запрос
            guard let url = URL(string: requestPath) else {
                return
            }
            let request = URLRequest(url: url) // відправити запит в мережу
            
            Task {
                do {
                    let response = try await URLSession.shared.data(for: request) // дочекались відповіді
                    
                    let data = response.0
                    
                    let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data) // перетворили JSON дані на модель прогнрозу погоди
                    
                    self.forecast = forecastResponse // передача ддя виводу на екран
                    
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
