//
//  HomeView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

internal import SwiftUI
import SwiftData

struct HomeView: View {
    // SwiftData
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Note.date, order: .reverse)
    private var notes: [Note]

    // UI State
    @State private var selectedNote: Note?
    @State private var showCreateNote = false

    // Note Type Counters
    private var undeterminedCount: Int {
        notes.filter { $0.status == .blank }.count
    }

    private var pendingCount: Int {
        notes.filter { $0.status == .pending }.count
    }

    private var incompletedCount: Int {
        notes.filter { $0.status == .incompleted }.count
    }

    private var completedCount: Int {
        notes.filter { $0.status == .completed }.count
    }

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                // Title
                Title()
                // Status counter
                StatusNotesCounterView(
                    blank: undeterminedCount,
                    pending: pendingCount,
                    incompleted: incompletedCount,
                    completed: completedCount
                )
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                    .padding(.horizontal)
            }
            // Notes List
            NotesListView()
        }
        .sheet(item: $selectedNote) { note in
            NoteEditView(note: note)
        } // Create note button
        .overlay(alignment: .bottomTrailing) {
            Button {
                createNote()
            } label: {
                AddNoteView()
            }
            .padding(.trailing, 30)
        }
    }

    // Actions
    private func createNote() {
        let newNote = Note()
        modelContext.insert(newNote)
        selectedNote = newNote
    }
}

#Preview {
    let container = PreviewContainer.make()
    let context = container.mainContext

    // Mock data
    context.insert(Note(title: "Buy milk", text: "2L", status: .pending, category: .shopping))
    context.insert(Note(title: "Workout", text: "Leg day", status: .completed, category: .health))
    context.insert(Note(title: "Study SwiftData", text: "WWDC videos", status: .incompleted, category: .studies))
    context.insert(Note(title: "Study UIKit", text: "WWDC videos", status: .blank, category: .unsettled))

    return HomeView()
        .modelContainer(container)
}
