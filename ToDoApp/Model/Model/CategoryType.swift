//
//  CategoryType.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 10/01/26.
//

import Foundation

enum CategoryType: String, Codable, CaseIterable, Identifiable {
    case unsettled = "Unsettled"
    case shopping = "Shopping"
    case home = "Home"
    case finance = "Finance"
    case development = "Development"
    case studies = "Studies"
    case work = "Work"
    case health = "Health"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .unsettled: "Unsettled"
        case .shopping: "🛒 Shopping"
        case .home: "🏠 Home"
        case .finance: "💰 Finance"
        case .development: "🧠 Development"
        case .studies: "📚 Studies"
        case .work: "💼 Work"
        case .health: "💪 Health"
        }
    }
}
