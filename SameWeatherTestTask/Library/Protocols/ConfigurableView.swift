//
//  ConfigurableView.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import Foundation

protocol ConfigurableView {
    
    associatedtype Model
    
    func configure(with model: Model)
}


