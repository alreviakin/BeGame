//
//  DateManager.swift
//  BeGame
//
//  Created by Алексей Ревякин on 18.06.2023.
//

import Foundation

class DateManager {
    static let shared = DateManager()
    
    private init() {}
    
    func getCurrentDate() -> String {
        let date = Date()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yy"
        return dateFormater.string(from: date)
    }
    
    func stringToDate(dateString: String) -> Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yy"
        return dateFormater.date(from: dateString) ?? Date()
    }
    
    func dateToString(date: Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yy"
        return dateFormater.string(from: date)
    }
    
    func getCurrentDate() -> Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yy"
        return stringToDate(dateString: getCurrentDate())
    }
    
    func intToTimeString(countTime: Int) -> String {
        let hours = countTime / 3600
        let minutes = countTime / 60 % 60
        let seconds = countTime % 60
        
        var times: [String] = []
        if hours > 0 {
          times.append("\(hours)h")
        }
        if minutes > 0 {
          times.append("\(minutes)m")
        }
        if hours == 0 {
            times.append("\(seconds)s")
        }
        return times.joined(separator: " ")
    }
}
