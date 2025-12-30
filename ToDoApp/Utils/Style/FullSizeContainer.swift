//
//  FullSizeContainer.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 27/12/25.
//

internal import SwiftUI

struct FullSizeContainer<Content: View>: View {

    @ViewBuilder let content: () -> Content

    var body: some View {
        GeometryReader { geo in
            content()
                .frame(
                    width: geo.size.width,
                    height: geo.size.height
                )
        }
    }
}

#Preview {
    FullSizeContainer {}
}
