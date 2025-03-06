//
//  CityCoordinatesreponse.swift
//  WeatherAPI
//
//  Created by Serhii Malyshko on 01.03.2025.
//

import Foundation

struct CityCoordinatesResponse: Codable {
    let name: String
    let lat: Double
    let lon: Double
    let country: String
}
