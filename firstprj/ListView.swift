//
//  ListView.swift
//  firstprj
//
//  Created by 유병찬 on 6/11/24.
//

import SwiftUI

struct ListView : View {
    
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
        List(fruits) { item in // .self 는 모든 인스턴스들이 암시적으로 생성하는 프로퍼티
            HStack {
                Circle()
                    .fill(item.color)
                    .frame(width: 20, height: 20)
                Text(item.name)
            }
        }
    }
}
