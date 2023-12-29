//
//  SameWeatherManager.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import Foundation
import RxSwift
import CoreLocation

protocol SameWeatherManagerProtocol {
    
    func fetchForecastWeatherObservable(city: String) -> Observable<CurrentWeatherResponse>
    
    func fetchForecastWeatherObservable(coord: CLLocation) -> Observable<CurrentWeatherResponse>
}

final class SameWeatherManager: SameWeatherManagerProtocol {
    
    private let networkManager: NetworkManagerProtocol
    
    public init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchForecastWeatherObservable(city: String) -> Observable<CurrentWeatherResponse> {
        self.networkManager.fetchModels(from: APIBuilder.fetchWeather(for: city))
    }
    
    func fetchForecastWeatherObservable(coord: CLLocation) -> Observable<CurrentWeatherResponse> {
        self.networkManager.fetchModels(from: APIBuilder.fetchWeatherCoordinate(for: coord))
    }
}
