//
//  StatusListView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 23/12/25.
//

internal import SwiftUI

struct StatusListView: View {

    @Binding var status: Status

    var body: some View {
        VStack(alignment: .leading) {
            Text("Status")
                .fontWeight(.bold)
            HStack {
                GridContainer(
                    items: Status.mocks,
                    columns: 3,
                    alignment: .leading,
                    spacing: 15) { mock in
                        HStack {
                            Circle()
                                .frame(width: 20)
                                .foregroundStyle(mock.color)
                            Text(mock.description)
                                .font(Font.system(size: 15))
                        }
                        .onTapGesture {
                            status = mock
                        }
                    }
            }
        }
    }
}

#Preview {
    @Previewable @State var status = Status.mocks[0]
    StatusListView(status: $status)
}
