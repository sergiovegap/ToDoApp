//
//  Status.swift
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
}

extension StatusType {
    var title: String { rawValue }

    var color: Color {
        switch self {
        case .blank: Color.white
        case .pending: .yellowNote
        case .incompleted: .redNote
        case .completed: .greenNote
        }
    }
}
