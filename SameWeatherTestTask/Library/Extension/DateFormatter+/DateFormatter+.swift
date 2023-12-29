//
//  DateFormatter+.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 28.12.2023.
//

import UIKit

extension DateFormatter {
    
    func getWeekDay(date: Int) -> String {
        let epochTime = date
        let newTime = Date(timeIntervalSince1970: TimeInterval(epochTime))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, hh:mm"
        let initTz = TimeZone(abbreviation: "GMT")!
        dateFormatter.timeZone = initTz
        return dateFormatter.string(from: newTime)
    }
}
