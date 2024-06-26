//
//  Note.swift
//  TodoList
//
//  Created by Peter Loux on 6/26/24.
//

import Foundation
import RealmSwift

class Note: Object, Identifiable {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var text: String = ""
}

