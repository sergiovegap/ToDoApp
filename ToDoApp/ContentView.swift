//
//  ContentView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

internal import SwiftUI
import SwiftData

// import HotReloading

struct ContentView: View {
    @Binding var status: Status
    @Binding var category: CategoryNote

    var body: some View {
        HomeView(status: $status, category: $category, noteViewModel: NoteViewModel())
    }
}

#Preview {
    @Previewable @State var status = Status.mocks[0]
    @Previewable @State var category = CategoryNote.mocks[0]
    ContentView(status: $status, category: $category)
}
