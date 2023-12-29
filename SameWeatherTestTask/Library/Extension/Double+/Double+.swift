//
//  Double+.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 26.12.2023.
//

import Foundation

extension Double {
    
    var celcius: Double {
        if self < 0 {
            return (self + 273.15)
        }
        return (self - 273.15)
    }
    
    var formattedCelcius: String {
        return String(format: "%g", celcius.rounded(.up))
    }
}
