//
//  NavigationView.swift
//  firstprj
//
//  Created by 유병찬 on 6/11/24.
//

import SwiftUI
struct NavigationViewView: View {
    
    @State var fruits = [Fruit(name: "Apple"), Fruit(name: "Banana")]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(fruits) { fruit in
                        NavigationLink(destination: DetailView()) {
                            Text(fruit.name)
                        }
                    }.onDelete(perform: del)

                }
                Button(action: add) {
                    Text("Add")
                }
            }
        
        }
    }
    
    func add() {
        fruits.append(Fruit(name: "temp"))
    }
    
    func del(offset: IndexSet) {
        fruits.remove(atOffsets: offset)
    }
}

struct Fruit: Identifiable {
    let id = UUID()
    let name: String
}

struct DetailView: View {
    var body: some View {
        Text("This is the Detail View")
            .navigationTitle("Detail")
    }
}
