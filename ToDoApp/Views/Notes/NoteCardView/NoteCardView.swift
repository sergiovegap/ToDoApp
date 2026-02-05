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

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(note.title)
                .font(.caption)
            HStack {
                Text(note.category.title)
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
    let container = PreviewContainer.make()
    let context = container.mainContext

    let note = Note(
        title: "Preview Card",
        text: "This is how a note card looks in isolation.",
        status: .blank,
        category: .unsettled
    )

    return NoteCardView(note: note)
        .padding()
        .modelContainer(container)
}
