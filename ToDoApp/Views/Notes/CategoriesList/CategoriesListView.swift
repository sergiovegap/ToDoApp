//
//  CategoriesListView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 23/12/25.
//

internal import SwiftUI
import SwiftData

struct CategoriesListView: View {
    @Binding var category: CategoryType

    var body: some View {
        VStack(alignment: .leading) {
            Text("Category")
                .fontWeight(.bold)
            GridContainer(
                items: CategoryType.allCases.filter { $0 != .unsettled },
                columns: 3,
                alignment: .leading,
                spacing: 15
            ) { item in
                Text(item.title)
                    .font(Font.system(size: 15))
                    .onTapGesture { category = item }
            }
            .gridCellColumns(2)
        }
    }
}

#Preview {
    @Previewable @State var selected: CategoryType = .finance
    CategoriesListView(category: $selected)
        .padding()
}
