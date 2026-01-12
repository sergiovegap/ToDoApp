//
//  StatusType.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 27/12/25.
//

import Foundation
internal import SwiftUI

enum StatusType: String, Codable, CaseIterable, Identifiable {
    case blank
    case pending
    case incompleted
    case completed

    var id: String { rawValue }

    var title: String {
        switch self {
        case .blank: "Undetermined"
        case .pending: "Pending"
        case .incompleted: "Incompleted"
        case .completed: "Completed"
        }
    }

    var color: Color {
        switch self {
        case .blank: Color.white
        case .pending: .yellowNote
        case .incompleted: .redNote
        case .completed: .greenNote
        }
    }
}
