//
//  ViewModel.swift
//  NotesSwiftData
//
//  Created by Illya Kovaliuk on 19.03.2026.
//

import Foundation
import SwiftData
import Observation

@Observable
@MainActor
class ViewModel{
    var modelContext: ModelContext
    var notes = [NoteModel]()
    var searchText: String = ""
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }
    
    var filteredNotes: [NoteModel]{
        if searchText.isEmpty{
            return notes
        }
        else {
            return notes.filter{ note in
                note.title.localizedStandardContains(searchText) ||
                note.info.localizedStandardContains(searchText)
            }
        }
    }
    
    func addnote(){
        let note = NoteModel(title: "", date: Date(), info: "")
        modelContext.insert(note)
        print("Created note \(note.title)")
    }
    
    func deleteNote(at offsets: IndexSet){
        for offset in offsets{
            let note = notes[offset]
            modelContext.delete(note)
        }
        
    }
    
    func fetchData(){
        do{
            let descriptor = FetchDescriptor<NoteModel>(sortBy: [SortDescriptor(\.title)])
            notes = try modelContext.fetch(descriptor)
        } catch{
            print("Fetching failed")
        }
    }
    
    
    
    
}

