//
//  AnimationView.swift
//  firstprj
//
//  Created by 유병찬 on 6/14/24.
//

import SwiftUI

struct AnimationView: View {
    @State private var moveDistance: CGFloat = 0
    @State private var isBlue: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView() {
                VStack() {
                    
                    Button("Animate") {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            moveDistance += 100
                            isBlue.toggle()
                        }
                    }.frame(width: 200, height: 100)
                        .background(.red)
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(isBlue ? Color.blue : Color.red)
                        .frame(width: 100, height: 100)
                        .offset(x: 0, y: moveDistance)
                    
                }
                .frame(maxWidth: .infinity, minHeight: geometry.size.height + moveDistance)
                .background(Color.gray)
                
            }.background(Color.black)
        }.background(Color.red)
    }
}
