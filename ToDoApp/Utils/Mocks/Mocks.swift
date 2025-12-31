//
//  Mocks.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

import Foundation
internal import SwiftUI

// Priority Mocks
extension Status {
//    static let blank = Status(id: 0, color: .clear, description: "", type: .blank)
    static let pending = Status(id: 1, color: .yellowNote, description: "Pending", type: .pending)
    static let incompleted = Status(id: 2, color: .redNote, description: "Incompleted", type: .incompleted)
    static let completed = Status(id: 3, color: .greenNote, description: "Completed", type: .completed)

    static let mocks = [pending, incompleted, completed]

    var sortOrder: Int {
        switch description {
        case "Pending": return 1
        case "Incompleted": return 2
        case "Completed": return 3
        default: return 0
        }
    }

    var title: String {
        description
    }
}

// Categories Mocks
extension CategoryNote {
    static let mocks: [CategoryNote] = [
//        CategoryNote(id: 0, name: ""),
        CategoryNote(id: 1, name: "🛒 Shopping"),
        CategoryNote(id: 2, name: "🏠 Home"),
        CategoryNote(id: 3, name: "💰 Finance"),
        CategoryNote(id: 4, name: "🧠 Development"),
        CategoryNote(id: 5, name: "📚 Studies"),
        CategoryNote(id: 6, name: "💼 Work"),
        CategoryNote(id: 7, name: "💪🏻 Health")
    ]
}

// Notes Mock Data
extension Note {
    static let mocks: [Note] = [
        Note(
            id: UUID().uuidString,
            title: "Pay credit card bill",
            description: "Ut dapibus, ex quis venenatis vulputate, lorem nulla tempus leo.",
            date: Date.daysAgo(2),
            status: Status.mocks[2],
            category: CategoryNote.mocks[2]
        ),
        Note(
            id: UUID().uuidString,
            title: "Send email to the team",
            description: "Ut dapibus, ex quis venenatis vulputate, lorem nulla tempus leo.",
            date: Date.daysAgo(1),
            status: Status.mocks[2],
            category: CategoryNote.mocks[5]
        ),
        Note(
            id: UUID().uuidString,
            title: "Prepare presentation for the meeting",
            description: "Ut dapibus, ex quis venenatis vulputate, lorem nulla tempus leo.",
            date: Date.daysAgo(2),
            status: Status.mocks[2],
            category: CategoryNote.mocks[5]
        ),
        Note(
            id: UUID().uuidString,
            title: "Running 5km",
            description: "Ut dapibus, ex quis venenatis vulputate, lorem nulla tempus leo.",
            date: Date.daysAgo(2),
            status: Status.mocks[1],
            category: CategoryNote.mocks[6]
        ),
        Note(
            id: UUID().uuidString,
            title: "Read a book",
            description: "Ut dapibus, ex quis venenatis vulputate, lorem nulla tempus leo.",
            date: Date.daysAgo(3),
            status: Status.mocks[0],
            category: CategoryNote.mocks[3]
        ),
        Note(
            id: UUID().uuidString,
            title: "Coding challenge",
            description: "Ut dapibus, ex quis venenatis vulputate, lorem nulla tempus leo.",
            date: Date.daysAgo(4),
            status: Status.mocks[2],
            category: CategoryNote.mocks[4]
        )
    ]
}
