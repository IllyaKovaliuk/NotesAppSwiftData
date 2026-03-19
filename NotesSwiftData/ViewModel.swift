//
//  ViewModel.swift
//  NotesSwiftData
//
//  Created by Illya Kovaliuk on 19.03.2026.
//

import Foundation
import SwiftData

@Observable
class ViewModel{
    var modelContext: ModelContext
    var notes = [NoteModel]()
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }
    
    func addnote(){
        let note = NoteModel(title: "", date: Date())
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

