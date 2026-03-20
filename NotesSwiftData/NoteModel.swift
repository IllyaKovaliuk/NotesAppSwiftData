//
//  NoteModel.swift
//  NotesSwiftData
//
//  Created by Illya Kovaliuk on 18.03.2026.
//

import Foundation
import SwiftData

@Model
class NoteModel{
    var title: String
    var date: Date
    var info: String = ""
    
    init(title: String, date: Date, info: String) {
        self.title = title
        self.date = date
        self.info = info
    }
}
