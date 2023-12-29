//
//  ModelForecastWheater.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import Foundation

struct DTOModelForecastWheater {
    let city: String
    let weathers: [ModelForecastWheaterCell]
}

struct ModelForecastWheater {
    let temp: String
    let image: String
    let city: String
}
