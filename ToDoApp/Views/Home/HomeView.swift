//
//  HomeView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

internal import SwiftUI

struct HomeView: View {

    @Binding var status: Status
    @Binding var category: CategoryNote
    @State private var selectedNote: NoteViewModel?
    @State private var showingModal = false
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
        repository: NoteRepositoryProtocol = EmptyMockNoteRepository(),
    ) {
        self._status = status
        self._category = category
        self._noteViewModel = StateObject(wrappedValue: noteViewModel)
        self._notesListViewModel = StateObject(wrappedValue: NotesListViewModel(repository: repository))
    }

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                // Title
                Title()
                // Status counter
                StatusNotesCounterView(
                    blank: notesListViewModel.blankCount,
                    pending: notesListViewModel.pendingCount,
                    incompleted: notesListViewModel.incompletedCount,
                    completed: notesListViewModel.completedCount)
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                    .padding(.horizontal)
            }
            // Notes List View
            NotesListView(status: $status, category: $category, noteViewModel: NoteViewModel())
        }
        .sheet(item: $selectedNote) {
            NoteEditView(noteViewModel: $0, status: $status, category: $category)
        } // Create note button
        .overlay(alignment: .bottomTrailing) {
            AddNoteView(status: $status, category: $category, noteViewModel: NoteViewModel())
                .padding(.trailing, 30)
        }
    }
}

#Preview {
    // Edition mode
    @Previewable @State var status = Status.mocks[0]
    @Previewable @State var category = CategoryNote.mocks[0]
    //    HomeView(status: $status, noteViewModel: NoteViewModel())

    // Creation mode
    HomeView(
        status: $status,
        category: $category,
        noteViewModel: NoteViewModel(),
//        repository: EmptyMockNoteRepository()
        repository: MockNoteRepository()
    )
}
