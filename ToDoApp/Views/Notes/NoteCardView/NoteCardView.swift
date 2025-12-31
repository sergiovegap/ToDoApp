//
//  NoteCardView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 23/12/25.
//

internal import SwiftUI

struct NoteCardView: View {

    @ObservedObject var noteViewModel: NoteViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(noteViewModel.title)
                .font(.headline)

            HStack {
                Text(noteViewModel.category.name)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text(noteViewModel.date, format: .dateTime.day().month().year())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .frame(minHeight: 75, maxHeight: 75)
        .frame(minWidth: 350, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 11)
        .fill(noteViewModel.status.color))
    }
}

#Preview {
    let note = Note.mocks.first!
    let noteViewModel = NoteViewModel(note: note)
    NoteCardView(noteViewModel: noteViewModel)
}
