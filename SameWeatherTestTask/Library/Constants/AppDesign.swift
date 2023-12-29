//
//  AppDesign.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import Foundation

enum AppDesign {
    
    static let offset: CGFloat = 20
    
    static let inset: CGFloat = 20
    
    static let yyy_MM_dd_HH_mm_ss = "MM-dd"
    
    static let typeWeatherImageHeight = 50
    
    static func widthDayLabel(_ width: CGFloat) -> CGFloat {
        width * 0.3
    }
 
}
