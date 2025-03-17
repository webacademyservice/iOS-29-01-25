//
//  NetworkResponse.swift
//  WeatherAPP-WA
//
//  Created by Oleksandr Hryhoruk on 2025-03-14.
//

//    https://api.openweathermap.org/data/2.5/forecast?q=London&appid=c1c97494842d36d110e3645ea3a077a7&units=metric

import Foundation

struct NetworkResponce: Codable {
    struct Main: Codable {
        let temp: Double
    }
    struct Forecast: Codable {
        let main: Main
        let dt: TimeInterval
    }
    let list: [Forecast]
}
