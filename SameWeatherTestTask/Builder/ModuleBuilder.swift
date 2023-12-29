//
//  ModuleBuilder.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 27.12.2023.
//

import UIKit

import UIKit

protocol AssemblyBuilderProtocol {
    
    func createMain(router: RouterProtocol) -> UIViewController
        
    func createListCities(router: RouterProtocol) -> UIViewController
    
    func createAlert(title: String, message: String, btnTitle: String, action: @escaping (() -> Void)) -> UIAlertController
}

final class ModuleBuilder: AssemblyBuilderProtocol {
    
    private let sameWeatherAPIManager: SameWeatherManagerProtocol
    
    private let cityManager = AppViewModel()
    
    init(sameWeatherAPIManager: SameWeatherManagerProtocol) {
        self.sameWeatherAPIManager = sameWeatherAPIManager
    }

    func createMain(router: RouterProtocol) -> UIViewController {
        let viewModel = ForecastWheaterViewModel(router: router,
                                                 sameWeatherAPIManager: sameWeatherAPIManager,
                                                 cityManager: cityManager)
        let view = ForecastWheaterController(viewModel: viewModel)
        return view
    }
    
    func createListCities(router: RouterProtocol) -> UIViewController {
        let viewModel = ListCityViewModel(sameWeatherAPIManager: sameWeatherAPIManager,
                                          cityManager: cityManager,
                                          router: router)
        let view = ListCityController(viewModel: viewModel)
        return view
    }
    
    func createAlert(title: String, message: String, btnTitle: String, action: @escaping (() -> Void)) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: btnTitle, style: .default) { _ in
            action()
        }
        alertController.addAction(action)
        return alertController
    }
}
