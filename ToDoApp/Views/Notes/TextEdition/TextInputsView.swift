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

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                TextField("Title", text: $title)
                    .font(.title)
                    .fontWeight(.bold)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                ZStack(alignment: .leading) {
                    if description.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Write something...")
                                .padding(.top, 9)
                                .padding(.leading, 5)
                                .foregroundColor(.gray)
                        }.zIndex(1)
                    }
                        VStack(alignment: .leading) {
                            TextEditor(text: $description)
                                .keyboardType(.default)
                                .frame(minHeight: 100, maxHeight: 200)
                                .scrollContentBackground(.hidden)
                            Spacer()
                        }.zIndex(0)
                    }
            }
        }
        .frame(height: 200)
        .padding(.top, 35)
        .padding(.leading)
        .padding(.trailing)
    }
}

#Preview {
    @Previewable @State var title = "Title"
    @Previewable @State var description = "Write something..."
    TextInputsView(title: $title, description: $description)
}
