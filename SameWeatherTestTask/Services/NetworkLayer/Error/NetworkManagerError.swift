//
//  NetworkManagerError.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import Foundation

enum NetworkManagerError: Error {
    
    case urlIsNil
}

enum ErrorTypes: String {
    case warning = "Warning"
    case internetConnection = "Please check your internet connection or try again later."
    case error = "Error"
    case update = "Update"
}


