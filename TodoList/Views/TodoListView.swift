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
    
    @Environment(\.realm) var realm
    @ObservedResults(Task.self) var tasks: Results<Task>
    
    var pendingTasks: [Task] {
        tasks.filter { $0.isCompleted == false }
    }
    
    var completedTasks: [Task] {
        tasks.filter { $0.isCompleted == true }
    }
    
    var body: some View {
        List {
            ForEach(Sections.allCases, id: \.self) { section in
                Section(header: Text(section.rawValue)) {
                    let filteredTasks = section == .pending ? pendingTasks : completedTasks
                    
                    if filteredTasks.isEmpty {
                        Text("No tasks.")
                    }
                    
                    ForEach(filteredTasks, id: \._id) { task in
                        TaskCellView(task: task)
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let task = filteredTasks[index]
                            guard let taskToDelete = realm.object(ofType: Task.self, forPrimaryKey: task._id) else {
                                return
                            }
                            
                            $tasks.remove(taskToDelete)
                        }
                    }
                }
            }.listStyle(.plain)
        }

    }
}

#Preview {
    TodoListView()
}
