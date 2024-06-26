//
//  Task.swift
//  TodoList
//
//  Created by Peter Loux on 6/25/24.
//

import Foundation
import RealmSwift

enum Priority: String, CaseIterable, PersistableEnum {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

class Task: Object, Identifiable {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String = ""
    @Persisted var isCompleted: Bool = false
    @Persisted var priority: Priority = .medium
}
