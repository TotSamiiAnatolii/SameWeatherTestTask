//
//  ForecastWheaterViewModel.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import Foundation
import RxSwift
import CoreLocation

protocol ForecastWheaterViewModelProtocol {
    
    var weather: PublishSubject<DTOModelForecastWheater?> { get }
    
    func viewDidLoad()
 
    func getCurrentLocation()
    
    func featchWeather(_ city: String)
    
    func showListCities()
    
    func featchWeatherLocation(_ coord: CLLocation)
    
    func showAlert(with error: Error)
}

final class ForecastWheaterViewModel: ForecastWheaterViewModelProtocol {
  
    //MARK: - Properties
    
    private let sameWeatherAPIManager: SameWeatherManagerProtocol
    
    private let router: RouterProtocol
    
    private let disposeBag = DisposeBag()
    
    private let mapper = Mapper()
    
    private let locationManager = LocationManager()
    
    public var weather = PublishSubject<DTOModelForecastWheater?>()
    
    //MARK: - Init
    
    init(
        router: RouterProtocol,
        sameWeatherAPIManager: SameWeatherManagerProtocol,
        cityManager: CityManager
    ) {
        self.sameWeatherAPIManager = sameWeatherAPIManager
        self.router = router
        viewDidLoad()
        subscribeCityManager(with: cityManager)
    }
    
    //MARK: - Methods
    
    func viewDidLoad() {
        getCurrentLocation()
    }
   
    func getCurrentLocation() {
        locationManager.currentLocation
            .subscribe { [weak self] location in
                guard let location else { return }
                self?.featchWeatherLocation(location)
            }
            .disposed(by: disposeBag)
    }
    
    func featchWeather(_ city: String) {
        sameWeatherAPIManager
            .fetchForecastWeatherObservable(city: city)
            .map {
                self.mapper.map(model: $0)
            }
            .subscribe { [weak self] success in
                self?.weather.onNext(success)
            } onError: {[weak self] error in
                print(error)
                self?.showAlert(with: error)
            }
            .disposed(by: disposeBag)
    }
    
    func featchWeatherLocation(_ coord: CLLocation) {
        sameWeatherAPIManager
            .fetchForecastWeatherObservable(coord: coord)
            .map {
                self.mapper.map(model: $0)
            }
            .subscribe { [weak self] success in
                self?.weather.onNext(success)
            } onError: {[weak self] error in
                print(error)
                self?.showAlert(with: error)
            }
            .disposed(by: disposeBag)
    }
    
    func subscribeCityManager(with cityManager: CityManager) {
        cityManager.currentCity
            .subscribe { [weak self] city in
                guard let city else { return }
                self?.featchWeather(city)
            }
            .disposed(by: disposeBag)
    }
    
    func showListCities() {
        router.showListCities()
    }
    
    func showAlert(with error: Error) {
        DispatchQueue.main.async {
            self.router.alert(title: ErrorTypes.error.rawValue,
                              message: error.localizedDescription,
                              btnTitle: ErrorTypes.update.rawValue) {[weak self] in
                guard let self else {return}
                self.getCurrentLocation()
            }
        }
    }
}
