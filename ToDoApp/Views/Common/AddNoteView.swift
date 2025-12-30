//
//  AddNoteView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

internal import SwiftUI

struct AddNoteView: View {

    @Binding var status: Status
    @Binding var category: CategoryNote
    @State private var showingModal = false
    @StateObject var noteViewModel: NoteViewModel

    var body: some View {

        Button {
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
            .sheet(isPresented: $showingModal) {
                NoteEditView(noteViewModel: noteViewModel, status: $status, category: $category)
                    .foregroundStyle(Color.black)
            }
        }
    }
}

#Preview {
    @Previewable @State var status = Status.mocks[0]
    @Previewable @State var category = CategoryNote.mocks[0]
    let note = Note.mocks.first!
    let noteViewModel = NoteViewModel(note: note)
    AddNoteView(status: $status, category: $category, noteViewModel: noteViewModel)
}
