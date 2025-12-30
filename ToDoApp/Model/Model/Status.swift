//
//  Status.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 27/12/25.
//

import Foundation
internal import SwiftUI

enum StatusType {
    case blank
    case pending
    case incompleted
    case completed
}

struct Status: Identifiable, Equatable {
    let id: Int
    let color: Color
    let description: String
    let type: StatusType
}
