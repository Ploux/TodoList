//
//  RealmManager.swift
//  TodoList
//
//  Created by Peter Loux on 6/25/24.
//

import Foundation
import RealmSwift

@Observable class RealmManager {

    let app: App
    
    var realm: Realm?
    static let shared = RealmManager()
    var user: User?
    var configuration: Realm.Configuration?
    
    private init() {
        self.app = App(id: "application-0-cqinudt")
    }
    
    @MainActor
    func initialize() async throws {
        
        // authentication
        user = try await app.login(credentials: Credentials.anonymous)
        
        self.configuration = user?.flexibleSyncConfiguration(initialSubscriptions: { subs in
            
            if let _ = subs.first(named: "all-tasks") {
                return
            } else {
                subs.append(QuerySubscription<Task>(name: "all-tasks"))
            }
            
        }, rerunOnOpen: true)
        
        realm = try! await Realm(configuration: configuration!, downloadBeforeOpen: .always)
        
    }
}
