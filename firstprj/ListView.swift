//
//  ListView.swift
//  firstprj
//
//  Created by 유병찬 on 6/11/24.
//

import SwiftUI
import OSLog

struct ListView : View {
    
    @State private var selectedFruits = Set<UUID>()
    
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
        List(fruits, selection: $selectedFruits) { item in // .self 는 모든 인스턴스들이 암시적으로 생성하는 프로퍼티
            HStack {
                Circle()
                    .fill(item.color)
                    .frame(width: 20, height: 20)
                Text(item.name)
            }
        }.navigationBarTitle("Fruits")
        .navigationBarItems(trailing: EditButton())
        .environment(\.editMode, .constant(.active))
        .onChange(of: selectedFruits) {
            for uuid in selectedFruits {
                _ = fruits.map { fruit in
                    if fruit.id == uuid {
                        let log = OSLog(subsystem: "kr.co.kworks.firstprj", category: "test")
                        os_log(.default, log: log, "fruit: \(fruit.name), color: \(fruit.color)")
                    }
                    return fruit
                }
            }
        }
        
        
    }
}
