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
    
    func getCurrentDate() -> Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yy"
        return stringToDate(dateString: getCurrentDate())
    }
}
