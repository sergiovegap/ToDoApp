//
//  Title.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 25/12/25.
//

internal import SwiftUI

struct Title: View {
    var body: some View {
        HStack {
            Text("To Do")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 16)
        .padding(.bottom, 8)
        .background(.background)
    }
}

#Preview {
    Title()
}
