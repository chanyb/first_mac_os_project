//
//  ObservableObjectView.swift
//  firstprj
//
//  Created by 유병찬 on 6/10/24.
//

import Foundation

class ObservableObjectObject : ObservableObject {
    @Published var counter : Int = 0
    
    func increment() {
        counter += 1
    }
}
