//
//  NoteEditView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

internal import SwiftUI
import SwiftData

struct NoteEditView: View {
    // SwiftData
    @Bindable var note: Note
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    // UI
    @FocusState.Binding var isInputFocused: Bool

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button {
                    createNote(note: note)
                } label: {
                    Image(systemName: "checkmark.circle.dotted")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                .frame(height: .infinity)
                .padding(.trailing, 20)
                .padding(.top, 20)
            }
            .background(.clear)
            FullSizeContainer {
                ScrollView {
                    // Text Inputs
                    TextInputsView(title: $note.title, description: $note.text, isInputFocused: $isInputFocused)
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

    // Actions
    private func createNote(note: Note) {
        modelContext.insert(note)
    }
}

#Preview {
    @Previewable @FocusState var isInputFocused: Bool
    let container = PreviewContainer.make()
    let context = container.mainContext

    let note = Note(
        title: "Preview Card",
        text: "This is how a note card looks in isolation",
        status: .pending,
        category: .work
    )

    context.insert(note)

    return NoteEditView(note: note, isInputFocused: $isInputFocused)
        .modelContainer(container)
}
