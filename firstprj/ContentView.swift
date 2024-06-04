//
//  ContentView.swift
//  firstprj
//
//  Created by 유병찬 on 6/3/24.
//

import SwiftUI
import CoreData

struct ContentView: View {



    var body: some View {
        // VStack은 기본 alignment가 center이고
        // leading을 택하면 다른 Stack 들 중 맨 앞에 맞추어 짐
        // trailing을 택하면 다른 Stack 들 중 맨 뒤에 맞추어 짐
        VStack() {
            Text("hello, world!").frame(width: 100, height: 100)
                .background(Color.gray)
            HStack() {
                Text("hello, world!").frame(width: 100, height: 100)
                    .background(Color.gray)
                Text("hello, world!").frame(width: 100, height: 100)
                    .background(Color.gray)
            }
            
            HStack() {
                Text("hello, world!").frame(width: 100, height: 100)
                    .background(Color.gray)
                Text("hello, world!").frame(width: 100, height: 100)
                    .background(Color.gray)
                Text("hello, world!").frame(width: 100, height: 100)
                    .background(Color.gray)
            }
        }
    }

    private func addItem() {
        
    }

    private func deleteItems() {
        
    }
}



#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
