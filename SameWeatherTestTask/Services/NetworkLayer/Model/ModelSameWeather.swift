//
//  ModelSameWeather.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 26.12.2023.
//

import Foundation

// MARK: - CurrentWeatherResponse

struct CurrentWeatherResponse: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [List]
    let city: City
}

// MARK: - City

struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Int
    let sunset: Int
}

// MARK: - Coord

struct Coord: Codable {
    let lat: Double
    let lon: Double
}

// MARK: - List

struct List: Codable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let rain: Rain?
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case weather
        case clouds
        case wind
        case visibility
        case pop
        case rain
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds

struct Clouds: Codable {
    let all: Int
}

// MARK: - Main

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let seaLevel: Int?
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case humidity
    }
}

// MARK: - Rain

struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Weather

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// MARK: - Wind

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
