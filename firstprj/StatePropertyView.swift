//
//  TestView.swift
//  firstprj
//
//  Created by 유병찬 on 6/4/24.
//

import SwiftUI

struct StatePropertyView : View {
    @State private var counter: Int = 0 // State Property Wrapper는 뷰 로컬 상태를 선언하는 데 사용된다. 상태가 변경되면 뷰가 다시 렌더링 된다.
    
    var body: some View {
        VStack {
            Text("Welcome to SwiftUI \(counter)") // String interpolation
                .font(.largeTitle)
                .padding()

            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.system(size: 100))
                .padding()

            Button(action: {
                counter += 1
                print("Button tapped" + String(counter)) // Integer to String
            }) {
                Text("Tap Me")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}


#Preview {
    StatePropertyView()
}
