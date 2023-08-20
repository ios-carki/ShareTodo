//
//  SettingView.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/14.
//

import SwiftUI

struct SettingView: View {
    weak var navigation: CustomNavigationController?
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Text("SettingView")
        }
        .navigationTitle("설정")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
