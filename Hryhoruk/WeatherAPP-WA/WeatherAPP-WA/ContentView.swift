//
//  ContentView.swift
//  WeatherAPP-WA
//
//  Created by Oleksandr Hryhoruk on 2025-03-14.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    @State var weatherData: NetworkResponce?  // Get data from Model (Network Response)
    
    // Only for Picker option
    let optionsCity = ["Vinnytsya","Lviv", "London", "New York", "Kiev", "Sydney", "Tokyo", "Singapore", "Beijing", "Wellington"]
    
    var body: some View {
        VStack {
            Text("Your selected city: \(query)")
            
            Picker("Select city", selection: $query) {
                ForEach(optionsCity, id: \.self) { option in
                    Text(option)
                }
            }.pickerStyle(WheelPickerStyle())
                .frame(height: 100)
                .clipped()
                
            //TextField("Location name", text: $query)  //  Read User data for type option
            
            Divider()
            
            // Show Model (Network Response) into display by help SwiftUI
            if let weatherData = weatherData {
                List(weatherData.list, id:\.dt) { forecast in
                    HStack{
                        Text("\(Date(timeIntervalSince1970: forecast.dt))")
                        Spacer()
                        Text("\(String(format: "%.1f", forecast.main.temp)) °C")
                            .font(.title)
                    }
                }
            } else {
                Spacer()
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Please select location")
                Spacer()
            }
        }
        .padding()
        
        // Change query to request
        .onChange(of: query) { oldValue, newValue in
            guard
                oldValue != newValue,
                newValue.count >= 4
            else {
                return
            }
            let requestPath = "https://api.openweathermap.org/data/2.5/forecast?q=\(newValue)&appid=c1c97494842d36d110e3645ea3a077a7&units=metric"
            guard let url = URL(string: requestPath) else {
                    return
                }
                // Send request to web network
                let request = URLRequest(url: url)
            Task {
                do {
                    // Waiting for response from network
                    let responce = try await URLSession.shared.data(for: request)
                    
                    let data = responce.0
                    
                    // Convert JSON data into Model of weather (NetworkResponce)
                    let networkResponse = try JSONDecoder().decode(NetworkResponce.self, from: data)
                    self.weatherData = networkResponse
                    
                } catch {
                    print("Error:\(error)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
