//
//  NoteEditView.swift
//  NotesSwiftData
//
//  Created by Illya Kovaliuk on 18.03.2026.
//

import SwiftUI

struct NoteEditView: View {
    @Bindable var note: NoteModel
    @Binding var selectedDate: Date
    var body: some View {
        Form{
            Section{
                TextField("Title", text: $note.title)
                    .textContentType(.name)
            }
            Section{
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                
                HStack {
                        Text("Обрано:")
                        Spacer()
                        Text(selectedDate.formatted(.dateTime.weekday(.wide).day()))
                            .foregroundColor(.secondary)
                    }
            }
            
            Section {
                TextField("Description", text: $note.info)
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
