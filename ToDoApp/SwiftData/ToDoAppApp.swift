//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

internal import SwiftUI
import SwiftData

@main
struct ToDoAppApp: App {

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: Note.self)
    }
}
