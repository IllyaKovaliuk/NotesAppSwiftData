//
//  ContentView.swift
//  NotesSwiftData
//
//  Created by Illya Kovaliuk on 18.03.2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var path = [NoteModel]()
    @Environment(\.modelContext) var modelContext
    @Query var notes: [NoteModel]
    var body: some View {
        NavigationStack(path: $path){
            List{
                ForEach(notes){ note in
                    NavigationLink(value: note){
                        Text(note.title)
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .navigationTitle("Notes App")
            .navigationDestination(for: NoteModel.self){ note in
                NoteEditView(note: note)
                
            }
            .toolbar{
                Button("Add note", systemImage: "plus", action: addnote)
            }
        }
    }
    
    func addnote(){
        let note = NoteModel(title: "", date: Date())
        modelContext.insert(note)
        path.append(note)
        print("Created note \(note.title)")
    }
    
    func deleteNote(at offsets: IndexSet){
        for offset in offsets{
            let note = notes[offset]
            modelContext.delete(note)
        }
        
    }
}

#Preview {
    ContentView()
}
