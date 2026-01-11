//
//  NoteEditView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

internal import SwiftUI
import HotReloading

struct NoteEditView: View {
    @ObservedObject var noteViewModel: NoteViewModel
    @Binding var status: Status
    @Binding var category: CategoryNote

    var body: some View {
        FullSizeContainer {
            ScrollView {
                // Text Inputs
                TextInputsView(title: $noteViewModel.title, description: $noteViewModel.description)
                // Categories $ Status List
                VStack(spacing: 25) {
                    CategoriesListView(category: $noteViewModel.category)
                    StatusListView(status: $noteViewModel.status)
                }
                .padding()
            }
        }
    }
}

#Preview {
    // Edition mode
    @Previewable @State var status = Status.mocks[0]
    @Previewable @State var category = CategoryNote.mocks[0]
//    let note = Note.mocks.first!
//    let noteViewModel = NoteViewModel(note: note)
//    NoteEditView(noteViewModel: noteViewModel, status: $status)

    // Creation mode
    NoteEditView(noteViewModel: NoteViewModel(), status: $status, category: $category)
}
