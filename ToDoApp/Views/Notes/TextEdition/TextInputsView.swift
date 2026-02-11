//
//  TextInputsView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 23/12/25.
//

internal import SwiftUI

struct TextInputsView: View {
    @Binding var title: String
    @Binding var description: String

    // UI
    @FocusState.Binding var isInputFocused: Bool

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                TextField("Title", text: $title)
                    .font(.title)
                    .fontWeight(.bold)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .focused($isInputFocused)
                    .onSubmit {
                        isInputFocused = false
                    }
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $description)
                        .frame(minHeight: 100, maxHeight: 200)
                        .scrollContentBackground(.hidden)
                        .focused($isInputFocused)
                    if description.isEmpty {
                        Text("Write something...")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                            .padding(.leading, 5)
                    }
                }
            }
        }
        .frame(height: 200)
        .padding(.top, 35)
        .padding(.horizontal)
    }
}

#Preview {
    @Previewable @State var title = "Title"
    @Previewable @State var description = "Write something..."
    @Previewable @FocusState var isInputFocused: Bool
    TextInputsView(title: $title, description: $description, isInputFocused: $isInputFocused)
}
