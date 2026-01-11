//
//  NoteCardView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 23/12/25.
//

internal import SwiftUI
import SwiftData

struct NoteCardView: View {
    let note: Note
//    @ObservedObject var noteViewModel: NoteViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(note.title)
                .font(.caption)

            HStack {
                Text(note.text)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                Spacer()
                Text(note.date, format: .dateTime.day().month().year())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .frame(minHeight: 75, maxHeight: 75)
        .frame(minWidth: 350, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 11)
            .fill(note.status.color))
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Note.self, configurations: config)

    let note = Note(
        title: "Preview Card",
        text: "This is how a note card looks in isolation.",
        status: .pending,
        category: .work
    )

    return NoteCardView(note: note)
        .padding()
        .modelContainer(container)
}

/*
 #Preview {
     let note = Note.mocks.first!
     let noteViewModel = NoteViewModel(note: note)
     NoteCardView(noteViewModel: noteViewModel)
 }
 */
