//
//  TodoListApp.swift
//  TodoList
//
//  Created by Peter Loux on 6/25/24.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @State private var realmManager = RealmManager.shared
    
    
    var body: some Scene {
        WindowGroup {
            VStack {
                
                if let configuration = realmManager.configuration, let realm = realmManager.realm {
                    ContentView()
                        .environment(\.realmConfiguration, configuration)
                        .environment(\.realm, realm)
                                        
                }
            }.task {
                try? await realmManager.initialize()
            }

        }
    }
}
