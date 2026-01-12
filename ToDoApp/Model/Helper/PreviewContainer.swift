//
//  PreviewContainer.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 10/01/26.
//

import SwiftData

enum PreviewContainer {
    static func make() -> ModelContainer {
        let schema = Schema([Note.self])

        let config = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: true
        )

        do {
            return try ModelContainer(
                for: schema,
                configurations: [config]
            )
        } catch {
            fatalError("Failed to create preview ModelContainer: \(error)")
        }
    }
}
