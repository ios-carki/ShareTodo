//
//  RegisterView.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import SwiftUI
import UIKit

import Cassette

struct RegisterView: View {
    weak var navigation: CustomNavigationController?
    @StateObject private var viewModel = RegisterViewModel()
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(spacing: 12) {
                VStack(spacing: 12) {
                    Circle()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(width: 150, height: 150)
                        .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 2)
                        .overlay(
                            ZStack {
                                if (viewModel.image != nil) {
                                    Image(uiImage: viewModel.image ?? UIImage())
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .clipShape(Circle())
                                } else {
                                    Circle()
                                        .stroke(Color.white, lineWidth: 5)
                                        .shadow(radius: 10)
                                    
                                    Image("setProfileImage")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.blue)
                                }
                                
                            }
                           
                        )
                    
                    Text("프로필 설정")
                        .foregroundColor(.blue)
                        .font(.callout)
                }
                .onTapGesture {
                    viewModel.presentSetProfile.toggle()
                }
                
                    
                CustomTextField(text: $viewModel.idText)
                    .setTitleText("ID")
                    .setPlaceHolderText("6자리 이상의 아이디를 입력하세요")
                
                CustomTextField(text: $viewModel.passwordText)
                    .setTitleText("Password")
                    .setPlaceHolderText("6~10자리의 비밀번호를 입력하세요")
                
                CustomTextField(text: $viewModel.nickNameText)
                    .setTitleText("NickName")
                    .setPlaceHolderText("2자리 이상의 닉네임를 입력하세요")
                
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
                
                BtnCassette(buttonMode: .normal(text: "회원가입"))
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
            .sheet(isPresented: $viewModel.presentGallery) {
                CustomImagePicker(sourceType: viewModel.presentCamera ? .camera : .photoLibrary, image: $viewModel.image, isPresented: $viewModel.presentGallery, isCaptured: $viewModel.isCaptured)
            }.actionSheet(isPresented: $viewModel.presentSetProfile) { () -> ActionSheet in
                ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [
                    ActionSheet.Button.default(Text("Camera"), action: {
                        viewModel.presentGallery = true
                        viewModel.presentCamera = true
                    }),
                    ActionSheet.Button.default(Text("Photo Library"), action: {
                        viewModel.presentGallery = true
                        viewModel.presentCamera = false
                    }), ActionSheet.Button.cancel()])
            }
            
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
