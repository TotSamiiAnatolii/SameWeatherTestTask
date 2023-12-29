//
//  APIBuilder.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import Foundation
import CoreLocation

enum Environment: String {
    case baseURL = "http://api.openweathermap.org"
    case apiKEY = "7d17287617bf8aac71c51da60989c8b6"
}

enum APIBuilder {
    
    static func fetchWeather(for City: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/forecast"
        components.queryItems = [
            URLQueryItem(name: "appid", value: Environment.apiKEY.rawValue),
            URLQueryItem(name: "q", value: City),
            URLQueryItem(name: "units", value: "metric")
        ]
        
        return components.url
    }
    
    static func fetchWeatherCoordinate(for Coordinate: CLLocation) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/forecast"
        components.queryItems = [
            URLQueryItem(name: "lat", value: String(Coordinate.coordinate.latitude)),
            URLQueryItem(name: "lon", value: String(Coordinate.coordinate.longitude)),
            URLQueryItem(name: "appid", value: Environment.apiKEY.rawValue),
            URLQueryItem(name: "units", value: "metric")
        ]
        return components.url
    }
    
    static func fetchWeatherImage(for Icon: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "openweathermap.org"
        components.path = "/img/wn/\(Icon).png"
        return components.url
    }
}
