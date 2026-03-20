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
    @Environment(\.modelContext) private var modelContext
    @Query var notes: [NoteModel]
    @State var viewModel: ViewModel
    @State var selectedDate = Date()
    var body: some View {
        NavigationStack(path: $path){
            List{
                ForEach(notes){ note in
                    NavigationLink(value: note){
                        Text(note.title)
                        Text(selectedDate.formatted(.dateTime.weekday(.wide).day()))
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                }
                .onDelete(perform: viewModel.deleteNote)
            }
            .navigationTitle("Notes App")
            .navigationDestination(for: NoteModel.self){ note in
                NoteEditView(note: note, selectedDate: $selectedDate)
                
            }
            .toolbar{
                Button("Add note", systemImage: "plus", action: viewModel.addnote)
            }
        }
    }
    
    
    
}

//#Preview {
//    ContentView(viewModel: ViewModel(modelContext: container.mainContext))
//}
