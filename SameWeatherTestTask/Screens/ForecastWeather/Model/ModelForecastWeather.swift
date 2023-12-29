//
//  ModelForecastWheater.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import Foundation

struct DTOModelForecastWeather {
    let city: String
    let weathers: [ModelForecastWeatherCell]
}

struct ModelForecastWeather {
    let temp: String
    let image: String
    let city: String
}
