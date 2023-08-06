//
//  LoginView.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/05.
//

import SwiftUI

struct LoginView: View {
    weak var navigation: CustomNavigationController?
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 12) {
                CustomTextField(text: $viewModel.idText)
                    .setPlaceHolderText("ID 입력")
                    .setTitleText("ID")
                
                CustomTextField(text: $viewModel.passwordText)
                    .setPlaceHolderText("Password 입력")
                    .setTitleText("Password")
                
                CustomToggle(isOn: $viewModel.autoLoginIsOn)
                    .setTitle("자동로그인")
                
                HStack(spacing: 12) {
                    CustomButton()
                        .setType(type: .normal)
                        .setTitle(title: "회원가입")
                        .click {
                            navigation?.pushViewController(UIHostingController(rootView: RegisterView(navigation: navigation)), animated: true)
                        }
                    
                    CustomButton()
                        .setType(type: .normal)
                        .setTitle(title: "로그인")
                }
                
                HStack {
                    Spacer()
                    VStack(spacing: 2) {
                        Text("비밀번호 찾기")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Divider()
                            .frame(height: 0.5)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                    }
                    .frame(width: 80)
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}