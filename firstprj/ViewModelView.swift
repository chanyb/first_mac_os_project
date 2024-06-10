//
//  ViewModelView.swift
//  firstprj
//
//  Created by 유병찬 on 6/10/24.
//
import SwiftUI
import Foundation

struct ViewModelView : View {
    
    // ObservableObject 를 가져올 ViewModel 변수 정의 @ObservaedObject 어노테이션 활용
    @ObservedObject var viewModel = ObservableObjectObject()
    
    var body: some View {
        VStack {
            // viewModel 객체를 관찰 하고 있으므로(ViewModel) 상태가 변경될 때마다 뷰를 변경한다.
            Text("Counter: \(viewModel.counter)")
                .font(.largeTitle)
            Button(action: {
                viewModel.increment() // viewModel 객체에 접근하여 상태를 변경한다.
            }) {
                Text("Increment")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
