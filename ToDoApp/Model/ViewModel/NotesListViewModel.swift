//
//  NotesListViewModel.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 23/12/25.
//

import Foundation
internal import Combine
internal import SwiftUI

final class NotesListViewModel: ObservableObject {
    // Publish state notes
    @Published private(set) var notes: [NoteViewModel] = []

    // Dependencies
    private let repository: NoteRepositoryProtocol

    // Status counters
    var blankCount: Int {
        notes.filter { $0.status.type == .blank }.count
    }
    var pendingCount: Int {
        notes.filter { $0.status.type == .pending }.count
    }
    var completedCount: Int {
        notes.filter { $0.status.type == .completed }.count
    }
    var incompletedCount: Int {
        notes.filter { $0.status.type == .incompleted }.count
    }

    // init
    init(repository: NoteRepositoryProtocol) {
        self.repository = repository
        loadNotes()
    }

    // Public API
    func loadNotes() {
        let domainNotes = repository.fetchNotes()
        let vms = domainNotes.map { NoteViewModel(note: $0) }
        notes = vms.sorted { $0.status.sortOrder < $1.status.sortOrder }
    }

    func orderNotes(for status: Status) -> [NoteViewModel] {
        self.notes.filter { $0.status.id == status.id }
    }

    func toggleNote(id: UUID) {
        guard notes.firstIndex(where: { $0.id == id.uuidString }) != nil else { return }
        persistChanges()
    }

    func addNote(_ note: Note) {
        var current = repository.fetchNotes()
        current.append(note)
        repository.save(current)
        loadNotes()
    }

    func deleteNote(at offsets: IndexSet) {
        var current = repository.fetchNotes()
        current.remove(atOffsets: offsets)
        repository.save(current)
        loadNotes()
    }

    private func persistChanges() {
        let domainNotes = notes.map {
            Note(
                id: $0.id,
                title: $0.title,
                description: $0.description,
                date: $0.date,
                status: Status.mocks.first { $0.description == $0.description }!,
                category: CategoryNote.mocks.first { $0.name == $0.name }!)
        }
        repository.save(domainNotes)
    }
}
