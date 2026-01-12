//
//  AddNoteView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

internal import SwiftUI
import SwiftData

struct AddNoteView: View {

    @Environment(\.modelContext) private var context
    @State private var showingModal = false
    @State private var newNote: Note?

    var body: some View {
        Button {
            let note = Note()
            context.insert(note)
            newNote = note
            showingModal = true
        } label: {
            ZStack {
                Image("ni-pen-line")
                    .frame(width: 40, height: 40)
            }
            .background(
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
                        .shadow(color: Color.gray, radius: 4)
                }
            )
            .sheet(item: $newNote) { note in
                NoteEditView(note: note)
                    .foregroundStyle(Color.black)
            }
        }
    }
}

#Preview {
    let container = PreviewContainer.make()
    return AddNoteView()
        .modelContainer(container)
}
