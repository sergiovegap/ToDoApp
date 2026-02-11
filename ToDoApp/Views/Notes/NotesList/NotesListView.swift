//
//  NotesListView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 25/12/25.
//

internal import SwiftUI
import SwiftData

struct NotesListView: View {
    // SwiftData
    @Environment(\.modelContext) private var context
    @Query(sort: \Note.date, order: .reverse)
    private var notes: [Note]

    private func delete(_ note: Note) {
        context.delete(note)
    }

    // UI State
    @Binding var selectedNote: Note?

    var body: some View {
        if notes.isEmpty { // If there are not notes
            NoNotesView()
                .animation(.easeInOut, value: notes.count)
        } else { // If there are notes
            List {
                ForEach(StatusType.allCases, id: \.self) { status in
                    let filteredNotes = notes.filter { $0.status == status }
                    if !filteredNotes.isEmpty {
                        Section {
                            ForEach(filteredNotes) { note in
                                NoteCardView(note: note)
                                    .listRowSeparator(.hidden, edges: .all)
                                    .listRowInsets(.init(top: 6, leading: 16, bottom: 6, trailing: 16))
                                    .listRowBackground(Color.clear)
                                    .onTapGesture { selectedNote = note }
                                    .swipeActions(edge: .trailing) {
                                        Button(role: .destructive) {
                                            delete(note)
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                            }
                        } header: {
                            Label(status.title, systemImage: status.image)
                                .textCase(.uppercase)
                                .font(.headline)
                        }
                        .headerProminence(.increased)
                    }
                }
            }
            .listStyle(.plain)
            .listSectionSpacing(0.0)
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    @Previewable @State var selectedNote: Note?
    let container = PreviewContainer.make()
    let context = container.mainContext

    // Mock notes
    context.insert(Note(title: "Buy milk", text: "2L of milk", status: .pending, category: .shopping))
    context.insert(Note(title: "Workout", text: "Leg day at gym", status: .completed, category: .health))
    context.insert(Note(title: "Study SwiftData", text: "Watch WWDC session", status: .incompleted, category: .studies))
    context.insert(Note(title: "Pay bills", text: "Electricity and water", status: .pending, category: .finance))
    context.insert(Note(title: "Clean house", text: "Living room and kitchen", status: .blank, category: .unsettled))

    return NotesListView(selectedNote: $selectedNote)
        .modelContainer(container)
}
