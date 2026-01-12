//
//  NoteEditView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

internal import SwiftUI
import SwiftData

struct NoteEditView: View {
    @Bindable var note: Note

    var body: some View {
        FullSizeContainer {
            ScrollView {
                // Text Inputs
                TextInputsView(title: $note.title, description: $note.text)
                // Categories $ Status List
                VStack(spacing: 25) {
                    CategoriesListView(category: $note.category)
                    StatusListView(status: $note.status)
                }
                .padding()
            }
        }
    }
}

#Preview {
    let container = PreviewContainer.make()
    let context = container.mainContext

    let note = Note(
        title: "Preview Card",
        text: "This is how a note card looks in isolation",
        status: .pending,
        category: .work
    )

    context.insert(note)

    return NoteEditView(note: note)
        .modelContainer(container)
}
