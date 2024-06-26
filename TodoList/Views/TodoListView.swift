//
//  TodoListView.swift
//  TodoList
//
//  Created by Peter Loux on 6/26/24.
//

import SwiftUI
import RealmSwift

enum Sections: String, CaseIterable {
    case pending = "Pending"
    case completed = "Completed"
}

struct TodoListView: View {
    
    @ObservedResults(Task.self) var tasks: Results<Task>
    
    var body: some View {
        List {
            ForEach(Sections.allCases, id: \.self) { section in
                Section {
                    ForEach(tasks, id: \._id) { task in
                        TaskCellView(task: task)
                    }
                } header: {
                    Text(section.rawValue)
                }
            }
        }.listStyle(.plain)
    }
}

#Preview {
    TodoListView()
}
