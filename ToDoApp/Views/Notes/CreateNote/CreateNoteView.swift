//
//  CreateNoteView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 09/02/26.
//

internal import SwiftUI
import SwiftData

struct CreateNoteView: View {
    // SwiftData
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    // UI State
    @State private var title: String = ""
    @State private var text: String = ""
    @State private var category: CategoryType = .unsettled
    @State private var status: StatusType = .blank
    // @FocusState private var isInputFocused: Bool
    @FocusState.Binding var isInputFocused: Bool

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button {
                    saveNote()
                    dismiss()
                } label: {
                    Image(systemName: "checkmark.circle.dotted")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                // .frame(height: .infinity)
                .padding(.trailing, 20)
                .padding(.top, 20)
            }
            .background(.clear)
            FullSizeContainer {
                ScrollView {
                    // Text Inputs
                    TextInputsView(title: $title, description: $text, isInputFocused: $isInputFocused)
                    // Categories $ Status List
                    VStack(spacing: 25) {
                        CategoriesListView(category: $category)
                        StatusListView(status: $status)
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                isInputFocused = true
            }
        }
    }

    private func saveNote() {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)

        // Only creates a note if it has text
        if !trimmedTitle.isEmpty || !trimmedText.isEmpty {
            let newNote = Note(
                title: trimmedTitle,
                text: trimmedText,
                status: status,
                category: category
            )
            modelContext.insert(newNote)
        }
    }
}

#Preview {
    @Previewable @FocusState var isInputFocused: Bool
    CreateNoteView(isInputFocused: $isInputFocused)
}
