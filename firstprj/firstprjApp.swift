//
//  firstprjApp.swift
//  firstprj
//
//  Created by 유병찬 on 6/3/24.
//

import SwiftUI

@main // 앱의 진입점
struct firstprjApp: App { // App은 Swift의 루트객체
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup { // 앱의 UI를 나타내는 Scene을 그룹화 한다.
            TestView() // 앱의 기본 View
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
