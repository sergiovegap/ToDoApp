//
//  Note.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

import Foundation
internal import SwiftUI

struct Note: Identifiable, Equatable {
    var id: String = UUID().uuidString
    let title: String
    let description: String
    let date: Date
    let status: Status?
    let category: CategoryNote?

    init(
        id: String,
        title: String,
        description: String,
        date: Date,
        status: Status,
        category: CategoryNote,
    ) {
        self.id = UUID().uuidString
        self.title = title
        self.description = description
        self.date = date
        self.status = status
        self.category = category
    }
}

struct CategoryNote: Identifiable, Equatable {
    let id: Int
    let name: String
}
