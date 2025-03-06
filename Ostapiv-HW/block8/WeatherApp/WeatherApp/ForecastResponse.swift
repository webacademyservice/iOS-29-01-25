//
//  ForecastResponse.swift
//  WeatherApp
//
//  Created by Denis Ostapiv on 25.02.2025.
//

import Foundation

struct ForecastResponse: Codable{
    
    struct Main: Codable {
        let temp: Double
    }
    
    struct Forecast: Codable {
        let main: Main
        let dt: TimeInterval
    }
    
    let list: [Forecast]
}

