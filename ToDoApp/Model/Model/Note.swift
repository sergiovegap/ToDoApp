//
//  Note.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

import Foundation
import SwiftData

@Model
final class Note {
    @Attribute(.unique)
    var id: UUID
    var title: String
    var text: String
    var date: Date
    var status: StatusType
    var category: CategoryType

    init(
        id: UUID = UUID(),
        title: String = "",
        text: String = "",
        date: Date = .now,
        status: StatusType = .blank,
        category: CategoryType = .general
    ) {
        self.id = id
        self.title = title
        self.text = text
        self.date = date
        self.status = status
        self.category = category
    }
}
