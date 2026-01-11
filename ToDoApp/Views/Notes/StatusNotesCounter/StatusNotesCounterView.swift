//
//  StatusNotesCounterView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

internal import SwiftUI
internal import Combine
import HotReloading

struct StatusNotesCounterView: View {

    let blank: Int
    let pending: Int
    let incompleted: Int
    let completed: Int

    var body: some View {
        HStack {
            // Pending
            Text("\(pending) pending,")
            // Incomplete
            Text("\(incompleted) incompleted,")
            // Completed
            Text("\(completed) completed")
        }
        .padding(.horizontal)
        .font(.subheadline)
        .foregroundStyle(Color.gray)
    }
}

#Preview {
    StatusNotesCounterView(blank: 1, pending: 3, incompleted: 2, completed: 2)
}
