//
//  NotesView.swift
//  TodoList
//
//  Created by Peter Loux on 6/26/24.
//

import SwiftUI
import RealmSwift

struct NotesView: View {
    
    @ObservedRealmObject var task: Task
    @State private var noteText: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter note", text: $noteText)
                .textFieldStyle(.roundedBorder)
            Button("Save Note") {
                let note = Note()
                note.text = noteText
                $task.notes.append(note)
                // clear the textbox
                noteText = ""
                
            }
            
            List {
                ForEach(task.notes.indices, id: \.self) { index in
                    let note = task.notes[index]
                    HStack {
                        Text("\(index + 1)")
                            .frame(width: 25, height: 25)
                            .background(.orange)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                        Text(note.text)
                    }
                }
                .onDelete(perform: $task.notes.remove)
                .listStyle(.plain)
            }
            .navigationBarTitle(task.title)
        }.padding()
    }
}

#Preview {
    NotesView(task: Task())
}
