//
//  NavigationView.swift
//  firstprj
//
//  Created by 유병찬 on 6/11/24.
//

import SwiftUI
struct NavigationViewView: View {
    
    @State var fruits = [Fruit(name: "Apple"), Fruit(name: "Banana"), Fruit(name: "Grape")]
    @State var text: String = ""
    @State private var selection = Fruit(name: "fruit")
    
    var body: some View {
        NavigationView {
            VStack {
                List(fruits, rowContent: fruitView)

                #if os(iOS)
                Button(action: add) {
                    Text("Add")
                }.toolbar{ EditButton() }
                #endif
            
                Text("Selected: \(selection)")
            }
        }
    }
    
    // 클로저를 변수로 정의
    let fruitView: (Fruit) -> AnyView = { fruit in
        AnyView( // AnyView
            HStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 20, height: 20)
                Text(fruit.name)
            }
        )
    }
    
    
    func add() {
        text = "asdfff"
        fruits.append(Fruit(name: "temp"))
    }
    
    func del(offset: IndexSet) {
        fruits.remove(atOffsets: offset)
    }

}

struct Fruit: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct DetailView: View {
    @Binding var text: String
    var body: some View {
        Text("This is the Detail View \(text)")
            .navigationTitle("Detail")
    }
}
