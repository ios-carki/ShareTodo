//
//  MainView.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/13.
//

import SwiftUI

struct MainView: View {
    weak var navigation: CustomNavigationController?
    
    var body: some View {
    
        ZStack {
            Color.gray.ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    HStack {
                        Circle()
                            .frame(height: 150)
                            .overlay(
                                Text("프사")
                                    .foregroundColor(.white)
                            )
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 150)
                            .overlay(
                                Text("할일목록(Todo")
                                    .foregroundColor(.white)
                            )
                    }
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 150)
                            .overlay(
                                Text("게시판 목록")
                                    .foregroundColor(.white)
                            )
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 150, height: 150)
                            .overlay(
                                Image(systemName: "person.fill.badge.plus")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.white)
                            )
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        Text("즐찾 게시판")
                            .frame(maxHeight: .infinity)

                        RoundedRectangle(cornerRadius: 12)
                            .frame(maxHeight: .infinity)
                            .foregroundColor(.teal)
                            .overlay(
                                VStack {
                                    ForEach(0..<15, id: \.self) { index in
                                        Text("asfd")
                                    }

                                }
                            )
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
