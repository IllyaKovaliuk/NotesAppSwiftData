//
//  NoteEditView.swift
//  NotesSwiftData
//
//  Created by Illya Kovaliuk on 18.03.2026.
//

import SwiftUI

struct NoteEditView: View {
    @Bindable var note: NoteModel
    var body: some View {
        Form{
            Section{
                TextField("Title", text: $note.title)
                    .textContentType(.name)
            }
        }
        .navigationTitle("Create note")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    NoteEditView()
//}
