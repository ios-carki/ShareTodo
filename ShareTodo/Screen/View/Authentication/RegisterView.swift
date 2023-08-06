//
//  RegisterView.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import SwiftUI

struct RegisterView: View {
    weak var navigation: CustomNavigationController?
    @StateObject private var viewModel = RegisterViewModel()
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(spacing: 12) {
                CustomTextField(text: $viewModel.idText)
                    .setTitleText("ID")
                
                CustomTextField(text: $viewModel.passwordText)
                    .setTitleText("Password")
                
                CustomTextField(text: $viewModel.nickNameText)
                    .setTitleText("NickName")
                
                Divider()
                    .frame(height: 1)
                    .background(Color.red)
                HStack {
                    Text("선택사항 (Option)")
                        .foregroundColor(.gray)
                        .frame(alignment: .leading)
                    Spacer()
                }
                
                HStack {
                    Text("성별입력 위치예정")
                        .frame(alignment: .leading)
                    Spacer()
                }
                
                HStack {
                    Text("생년월일 위치예정")
                        .frame(alignment: .leading)
                    Spacer()
                }
                
                CustomButton()
                    .setType(type: .normal)
                    .setTitle(title: "회원가입")
                    .click {
                        viewModel.registerUser { result in
                            if result {
                                navigation?.popViewController(animated: true)
                            } else {
                                
                            }
                        }
                    }
                
            }
            .padding(.horizontal, 16)
            
            if viewModel.isLoading {
                CustomProgress(isLoading: viewModel.isLoading)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
