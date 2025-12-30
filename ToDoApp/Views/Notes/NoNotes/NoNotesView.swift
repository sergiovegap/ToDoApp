//
//  NoNotesView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 25/12/25.
//

internal import SwiftUI

struct NoNotesView: View {
    var body: some View {
        FullSizeContainer {
            VStack(alignment: .center, spacing: 16) {
                Image("Empty-Note-Pad")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                Text("No notes yet")
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    NoNotesView()
}
