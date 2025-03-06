//
//  ForecastResponse.swift
//  WeatherAPI
//
//  Created by Serhii Malyshko on 05.03.2025.
//

import Foundation

struct ForecastResponse: Codable {
    struct Main: Codable {
        let temp: Double
    }
    let main: Main
    let dt: TimeInterval
    let name: String
}
