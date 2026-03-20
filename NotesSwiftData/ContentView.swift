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
                ForEach(viewModel.filteredNotes){ note in
                    NavigationLink(value: note){
                        Text(note.title)
                        Text(selectedDate.formatted(.dateTime.weekday(.wide).day()))
                            .font(.subheadline)
                            .fontWeight(.thin)
                        Text(note.info)
                    }
                }
                .onDelete(perform: viewModel.deleteNote)
            }
            
            .searchable(text: $viewModel.searchText)
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
