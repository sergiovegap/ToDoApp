//
//  NoteViewModel.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

/*
import Foundation
internal import SwiftUI
internal import Combine

final class NoteViewModel: ObservableObject, Identifiable, Hashable {

    // To be able to use path in HomeView
    static func == (lhs: NoteViewModel, rhs: NoteViewModel) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // Variables
    let id: String
    @Published var title: String
    @Published var description: String
    @Published var date: Date
    @Published var status: StatusType
    @Published var category: CategoryType

    // Create note
    init() {
        self.id = UUID().uuidString
        self.title = ""
        self.description = ""
        self.date = Date()
        self.status = StatusType.mocks[0]
        self.category = CategoryType.mocks[0]
    }

    // Edit note
    init(note: Note) {
        self.id = note.id
        self.title = note.title
        self.description = note.description
        self.date = note.date
        self.status = note.status!
        self.category = note.category!
    }

    func toDomain() -> Note {
        Note(
            id: id,
            title: title,
            description: description,
            date: date,
            status: status,
            category: category
        )
    }
}
*/
