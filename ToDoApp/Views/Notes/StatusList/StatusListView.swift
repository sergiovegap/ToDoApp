//
//  StatusListView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 23/12/25.
//

internal import SwiftUI

struct StatusListView: View {
    @Binding var status: StatusType

    var body: some View {
        VStack(alignment: .leading) {
            Text("Status")
                .fontWeight(.bold)
            HStack {
                GridContainer(
                    items: [StatusType.pending, StatusType.incompleted, StatusType.completed],
                    columns: 3,
                    alignment: .leading,
                    spacing: 15
                ) { type in
                    HStack {
                        Circle()
                            .foregroundStyle(type.color)
                            .overlay(
                                Circle()
                                    .strokeBorder(Color.black, lineWidth: 1)
                            )
                            .frame(width: 20)
                        Text(type.title)
                            .font(Font.system(size: 15))
                    }
                    .onTapGesture {
                        status = type
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var status = StatusType.pending
    StatusListView(status: $status)
}
