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
    @Query(sort: \Note.date, order: .reverse)
    private var notes: [Note]

    // UI State
    @State private var selectedNote: Note?

    var body: some View {
        if notes.isEmpty { // If there are not notes
            NoNotesView()
                .animation(.easeInOut, value: notes.count)
        } else { // If there are notes
            ScrollView {
                LazyVGrid(columns: [.init(.flexible())]) {
                    ForEach(StatusType.allCases) { status in
                        let filteredNotes = notes.filter { $0.status == status }
                        if !filteredNotes.isEmpty {
                            Section {
                                ForEach(filteredNotes) { note in
                                    NoteCardView(note: note)
                                        .onTapGesture { selectedNote = note }
                                }
                            } header: {
                                Text(status.title)
                                    .textCase(.uppercase)
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 10)
                            }
                        }
                    }
                }
            }
            .padding()
        }
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
    context.insert(Note(title: "Clean house", text: "Living room and kitchen", status: .blank, category: .home))

    return NotesListView()
        .modelContainer(container)
}
