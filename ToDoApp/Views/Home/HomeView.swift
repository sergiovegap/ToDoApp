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
    @State var selectedNote: Note?
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
            NotesListView(selectedNote: $selectedNote)
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

    // Mock notes
    context.insert(Note(title: "Buy milk", text: "2L of milk", status: .pending, category: .shopping))
    context.insert(Note(title: "Workout", text: "Leg day at gym", status: .completed, category: .health))
    context.insert(Note(title: "Study SwiftData", text: "Watch WWDC sessions", status: .incompleted, category: .studies))
    context.insert(Note(title: "Pay bills", text: "Electricity and water", status: .pending, category: .finance))
    context.insert(Note(title: "Clean house", text: "Living room and kitchen", status: .blank, category: .unsettled))

    return HomeView()
        .modelContainer(container)
}
