//
//  GridContainer.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 28/12/25.
//

internal import SwiftUI

struct GridContainer<Data, Content>: View
where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {

    let items: Data
    var columns: Int
    var alignment: HorizontalAlignment
    let spacing: CGFloat
    let content: (Data.Element) -> Content

    init(
        items: Data,
        columns: Int,
        alignment: HorizontalAlignment,
        spacing: CGFloat = 15,
        content: @escaping (Data.Element) -> Content)
     {
        self.items = items
        self.columns = max(columns, 1) // 1 column for security
        self.alignment = alignment
        self.spacing = spacing
        self.content = content
     }

    private var gridItems: [GridItem] {
        Array(repeating: GridItem(), count: columns)
    }

    var body: some View {
        LazyVGrid(columns: gridItems, alignment: alignment, spacing: spacing) {
            ForEach(items) { item in
                content(item)
            }
        }
    }
}

#Preview {
    GridContainer(items: Status.mocks, columns: 3, alignment: .leading, spacing: 15) { status in
        HStack {
            Circle()
                .fill(status.color)
                .frame(width: 12)
            Text(status.description)
                .font(.subheadline)
        }
    }
    .padding()
}
