//
//  Date.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 26/12/25.
//

import Foundation

extension Date {
    static func daysAgo(_ days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -days, to: Date()) ?? Date()
    }
}
