//
//  BindingView.swift
//  firstprj
//
//  Created by 유병찬 on 6/4/24.
//

import SwiftUI

struct BindingView : View {
    @State private var counter: Int = 0
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            Text("Welcome to SwiftUI \(counter)")
                .font(.largeTitle)
                .padding()

            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.system(size: 100))
                .padding()

            Button(action: {
                counter += 1
                print("Button tapped" + String(counter))
            }) {
                Text("Tap Me")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Toggle(isOn: $isOn) { // 현재 뷰(부모뷰)에 있는 상태 'isOn'을 Toggle에 바인딩한다.
                // binding은 외부에서 전달된 '상태'를 자식 뷰에서 수정할 수 있게 한다.
                // 자식 뷰에서 상태를 변경할 수 있도록 해주는 것이 바인딩
                if isOn {
                    Text("Switch is ON")
                } else {
                    Text("Switch is OFF")
                }
            }
            .padding()
            
            
        }
    }
}


#Preview {
    BindingView()
}
