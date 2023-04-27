//
//  NotesApp_CoreDataApp.swift
//  NotesApp-CoreData
//
//  Created by Glenn Ludszuweit on 26/04/2023.
//

import SwiftUI

@main
struct NotesApp_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
