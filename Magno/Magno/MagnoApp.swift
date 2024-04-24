//
//  MagnoApp.swift
//  Magno
//
//  Created by Gilberto Magno on 10/04/24.
//

import SwiftUI
import SwiftData

@main
struct MagnoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            BoardView()
        }
        .modelContainer(sharedModelContainer)
    }
}
