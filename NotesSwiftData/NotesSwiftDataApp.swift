//
//  NotesSwiftDataApp.swift
//  NotesSwiftData
//
//  Created by Illya Kovaliuk on 18.03.2026.
//

import SwiftUI
import SwiftData

@main
struct NotesSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: NoteModel.self)
    }
}
