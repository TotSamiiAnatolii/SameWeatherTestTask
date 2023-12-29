//
//  CityManager.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 28.12.2023.
//

import Foundation
import RxSwift

protocol CityManager {
    
    var currentCity: PublishSubject<String?> { get set }
}

final class AppViewModel: CityManager {
    
    var currentCity: PublishSubject<String?> = PublishSubject()
}
