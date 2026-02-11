//
//  AddNoteView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

internal import SwiftUI
import SwiftData

struct AddNoteView: View {
    var body: some View {
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
    }
}

#Preview {
    let container = PreviewContainer.make()
    return AddNoteView()
        .modelContainer(container)
}
