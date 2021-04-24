//
//  FullDateFormatter.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 22/04/21.
//

import Foundation

struct FullDateFormatter {
    
    private static func getWeekDay(from date: Date) -> String {
        let formatter = DateFormatter()
        let weekDay = formatter.weekdaySymbols[Calendar.current.component(.weekday, from: date) - 1]
        return weekDay
    }
    
    private static func getMonthDayYearHour(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateFormat = "MMM dd, yyyy, hh:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: date)
    }
    
    
    static func fullDate(from date: Date) -> String {
        let dateString = "\(getWeekDay(from: date).uppercased()), \(getMonthDayYearHour(from: date).uppercased())"
        return dateString
    }
}
