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

        return try! ModelContainer(
            for: schema,
            configurations: [config]
        )
    }
}
