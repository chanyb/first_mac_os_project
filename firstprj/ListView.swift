//
//  ListView.swift
//  firstprj
//
//  Created by 유병찬 on 6/11/24.
//

import SwiftUI
import OSLog

struct ListView : View {
    
    let log = OSLog(subsystem: "kr.co.kworks.firstprj", category: "test")
    @State private var selectedFruits = Set<UUID>()
    
    #if os(iOS)
    @State private var editMode: EditMode = .inactive
    #elseif os(macOS)
    @State private var isEditing: Bool = false
    
    #endif
    
    struct Fruit : Identifiable {
        let id = UUID()
        let name: String
        var count: Int
        let color: Color
    }
    
    let fruits = [
        Fruit(name: "banana", count: 1, color: .yellow),
        Fruit(name: "apple", count: 1, color: .red)
    ]
    
    var body : some View {
        #if os(iOS)
        CommListView.navigationBarTitle("Fruits")
        .navigationBarItems(trailing: EditButton())
        .environment(\.editMode, .constant(.active))
        .onChange(of: selectedFruits) {
            for uuid in selectedFruits {
                _ = fruits.map { fruit in
                    if fruit.id == uuid {
                        os_log(.default, log: log, "fruit: \(NSLocalizedString(fruit.name, comment: "1")), color: \(fruit.color)")
                    }
                    return fruit
                }
            }
        }
        #elseif os(macOS)
        CommListView
            .frame(minWidth: 400, minHeight: 300)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        isEditing.toggle()
                    }) {
                        Text(isEditing ? "Done" : "Edit")
                    }
                }
            }
            .onChange(of: selectedFruits, initial: false) { selection, inital in
                for uuid in selectedFruits {
                    _ = fruits.map { fruit in
                        if fruit.id == uuid {
                            os_log(.default, log: log, "fruit: \(NSLocalizedString(fruit.name, comment: "1")), color: \(fruit.color)")
                        }
                    }
                }
            }
        #endif
        
        
    }
    
    var CommListView: some View {
        List(fruits, selection: $selectedFruits) { item in // .self 는 모든 인스턴스들이 암시적으로 생성하는 프로퍼티
            HStack {
                Circle()
                    .fill(item.color)
                    .frame(width: 20, height: 20)
                Text(item.name)
                Text(NSLocalizedString(item.name, comment: "1"))
            }
        }
    }
}
