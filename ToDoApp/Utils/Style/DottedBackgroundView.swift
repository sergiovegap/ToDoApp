//
//  DottedBackgroundView.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 29/12/25.
//

internal import SwiftUI

struct DottedBackgroundView: View {

    var dotSize: CGFloat = 4
    var spacing: CGFloat = 12
    var color: Color = .gray.opacity(0.4)


    var body: some View {
        
    }
}

#Preview {
    DottedBackgroundView(dotSize: 5, spacing: 20, color: .gray)
}
