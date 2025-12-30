//
//  Item.swift
//  ToDoApp
//
//  Created by Sergio Vega Perera on 22/12/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
