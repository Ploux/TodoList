//
//  ContentView.swift
//  TodoList
//
//  Created by Peter Loux on 6/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var taskName: String = ""
    @State private var priority: Priority = .medium
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter task", text: $taskName)
                    .textFieldStyle(.roundedBorder)
                Picker("Priority", selection: $priority) {
                    ForEach(Priority.allCases, id: \.self) { priority in
                        Text(priority.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                Button {
                    // action
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                    .navigationTitle("Tasks")
            } // end Vstack
            .padding()
        } // end nav view
    } // end body
} // end content view

#Preview {
    ContentView()
}
