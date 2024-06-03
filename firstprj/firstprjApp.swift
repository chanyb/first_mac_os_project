//
//  firstprjApp.swift
//  firstprj
//
//  Created by 유병찬 on 6/3/24.
//

import SwiftUI

@main
struct firstprjApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
