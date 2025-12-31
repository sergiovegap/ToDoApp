//
//  NotesListView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 25/12/25.
//

internal import SwiftUI

struct NotesListView: View {

    @Binding var status: Status
    @Binding var category: CategoryNote
    @State private var selectedNote: NoteViewModel?
    @StateObject var noteViewModel: NoteViewModel
    @StateObject private var emptynotesListViewModel = NotesListViewModel(
        repository: EmptyMockNoteRepository()
    )
    @StateObject private var notesListViewModel = NotesListViewModel(
        repository: MockNoteRepository()
    )

    init(
        status: Binding<Status>,
        category: Binding<CategoryNote>,
        noteViewModel: NoteViewModel,
//        repository: NoteRepositoryProtocol = EmptyMockNoteRepository(),
        repository: NoteRepositoryProtocol = MockNoteRepository(),
    ) {
        self._status = status
        self._category = category
        self._noteViewModel = StateObject(wrappedValue: noteViewModel)
        self._notesListViewModel = StateObject(wrappedValue: NotesListViewModel(repository: repository))
    }

    var body: some View {
        // If there are not notes
        if notesListViewModel.notes.isEmpty {
            NoNotesView()
                .animation(.easeInOut, value: notesListViewModel.notes.count)
        } else {
            // If there are notes
            ScrollView {
                LazyVGrid(columns: [.init(.flexible())]) {
                    ForEach(Status.mocks) { status in
                        let filteredNotes = notesListViewModel.orderNotes(for: status)
                        if !filteredNotes.isEmpty {
                            Section {
                                ForEach(filteredNotes) { note in
                                    NoteCardView(noteViewModel: note)
                                        .onTapGesture { selectedNote = note }
                                }
                            } header: {
                                Text(status.title)
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
    // Edition mode
    @Previewable @State var status = Status.mocks[0]
    @Previewable @State var category = CategoryNote.mocks[0]

    NotesListView(
        status: $status,
        category: $category,
        noteViewModel: NoteViewModel(),
//        repository: EmptyMockNoteRepository())
        repository: MockNoteRepository())
}
