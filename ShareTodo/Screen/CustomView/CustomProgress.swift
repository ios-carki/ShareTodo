//
//  CustomProgress.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import SwiftUI

struct CustomProgress: View {
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.1)
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color.red, lineWidth: 5)
                .frame(width: 50, height: 50)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear
                    .repeatForever(autoreverses: false), value: isLoading)
                .onAppear {
                    isLoading = true
                }
        }.frame(maxWidth: .infinity,maxHeight: .infinity).ignoresSafeArea().contentShape(Rectangle())
    }
}

struct CustomProgress_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgress()
    }
}
