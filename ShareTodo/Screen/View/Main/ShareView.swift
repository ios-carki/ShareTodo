//
//  ShareView.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/14.
//

import SwiftUI

struct ShareView: View {
    weak var navigation: CustomNavigationController?
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Text("ShareView")
        }
        .navigationTitle("공유")
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView()
    }
}
