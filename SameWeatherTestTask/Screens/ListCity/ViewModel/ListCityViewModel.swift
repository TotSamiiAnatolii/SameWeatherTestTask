//
//  ListCityViewModel.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import Foundation
import RxSwift

protocol ListCityViewModelProtocol {
    
    func selectedCity(with City: String)
    
    func popToRoot()
}

final class ListCityViewModel: ListCityViewModelProtocol {
    
    //MARK: - Properties
    
    private var model: ModelNameCityCell?
    
    private let sameWeatherAPIManager: SameWeatherManagerProtocol
    
    private var cityManager: CityManager
    
    private var router: RouterProtocol
    
    //MARK: - Init
    
    init(sameWeatherAPIManager: SameWeatherManagerProtocol, cityManager: CityManager, router: RouterProtocol) {
        self.sameWeatherAPIManager = sameWeatherAPIManager
        self.cityManager = cityManager
        self.router = router
    }
    
    func selectedCity(with City: String) {
        cityManager.currentCity.onNext(City)
    }
    
    func popToRoot() {
        router.popToRoot()
    }
}

