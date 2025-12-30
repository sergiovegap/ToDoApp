//
//  View.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 29/12/25.
//

internal import SwiftUI

extension View {
    func dottedBackground(
        dotSize: CGFloat = 3,
        spacing: CGFloat = 14,
        color: Color = .gray.opacity(0.25)
    ) -> some View {
        background(
            DottedBackgroundView(
                dotSize: dotSize,
                spacing: spacing,
                color: color
            )
        )
    }
}
