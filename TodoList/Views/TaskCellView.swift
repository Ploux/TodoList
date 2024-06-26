//
//  TaskCellView.swift
//  TodoList
//
//  Created by Peter Loux on 6/26/24.
//

import SwiftUI

struct TaskCellView: View {
    
    let task: Task
    
    private func priorityBackground(_ priority: Priority) -> Color {
        switch priority {
        case .low:
            return .gray
        case .medium:
            return .orange
        case .high:
            return .red
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: "square")
            Text(task.title)
            Spacer()
            Text(task.priority.rawValue)
                .padding(6)
                .frame(width: 75)
                .background(priorityBackground(task.priority))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        }
    }
}

//#Preview {
//    TaskCellView()
//}
