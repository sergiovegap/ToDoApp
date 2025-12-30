//
//  CategoriesListView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 23/12/25.
//

internal import SwiftUI

struct CategoriesListView: View {

    @Binding var category: CategoryNote

    var body: some View {
        VStack(alignment: .leading) {
            Text("Category")
                .fontWeight(.bold)
            GridContainer(
                items: CategoryNote.mocks,
                columns: 3,
                alignment: .leading,
                spacing: 15)
              { mock in
                Text(mock.name)
                    .font(Font.system(size: 15))
                    .onTapGesture { category = mock }
              }
            .gridCellColumns(2)
        }
        .dottedBackground()
    }
}

#Preview {
    @Previewable @State var selectedCategory = CategoryNote.mocks.first!
    CategoriesListView(category: $selectedCategory)
}
