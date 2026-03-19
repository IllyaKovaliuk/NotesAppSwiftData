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
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            ContentView(/*modelContext: container.mainContext,*/ viewModel: ViewModel(modelContext: container.mainContext))
        }
        .modelContainer(for: NoteModel.self)
    }
    init() {
           do {
               container = try ModelContainer(for: NoteModel.self)
           } catch {
               fatalError("Failed to create ModelContainer for Note.")
           }
       }
}
