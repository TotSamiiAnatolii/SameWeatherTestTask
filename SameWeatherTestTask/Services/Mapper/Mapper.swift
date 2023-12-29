//
//  Mapper.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 26.12.2023.
//

import UIKit

protocol MapperProtocol {
    
    associatedtype InputType
    associatedtype OutputType
    
    func map(model: InputType) -> OutputType
}
extension MapperProtocol {
    
    func map(model: [InputType]) -> [OutputType] {
        model.map(map)
    }
}

final class Mapper: MapperProtocol {
    
    func map(model: CurrentWeatherResponse) -> DTOModelForecastWheater {
        
        DTOModelForecastWheater(city: model.city.name, weathers: model.list.map({ weather in
//            print(String(weather.main.temp))
//            print(String(weather.main.temp.celcius.formattedCelcius))
            
           return  ModelForecastWheaterCell(temp: String(weather.main.temp.celcius.formattedCelcius),
                                     image: weather.weather.first?.icon ?? "",
                                     date:  weather.dt)
            
        }))
    }
}
