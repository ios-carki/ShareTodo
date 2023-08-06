//
//  CustomButton.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import SwiftUI

struct CustomButton: View {
    
    private var disabled : Binding<Bool>?
    private var title: String?
    private var backgroundColor: Color?
    private var borderColor: Color?
    private var textColor: Color?
    private var buttonClick: (()->Void)?
    
    var body: some View {
        VStack{
            Button {
                buttonClick?()
            } label: {
                Text(title ?? "")
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 48)
                .opacity(disabled?.wrappedValue ?? false ? 0.5 : 1)
                .background(
                    (disabled?.wrappedValue == true) ? Color.gray : backgroundColor
                )
                .foregroundColor((disabled?.wrappedValue == true) ? .white : textColor)
                .cornerRadius(12.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 12.0)
                    .stroke(
                        (disabled?.wrappedValue ?? false) ? .gray : (borderColor ?? .orange),
                        lineWidth: 1.5
                    ).frame(height:50)
                )
                //Font
            }.disabled(disabled?.wrappedValue ?? false)
        }
    }
}

extension CustomButton{
    func setDisabled(disabled: Binding<Bool>?) -> Self {
        var copy = self
        copy.disabled = disabled
        return copy
    }
    func setTitle(title: String?) -> Self{
        var copy = self
        copy.title = title
        return copy
    }
    func setType(type: CustomButtonType?) -> Self{
        var copy = self
        
        if type == .normal {
            copy.backgroundColor = .black
            copy.borderColor = .clear
            copy.textColor = .white
        }
        
        if type == .clear {
            copy.backgroundColor = .clear
            copy.borderColor = .black
            copy.textColor = .black
        }
        
        if type == .gray {
            copy.backgroundColor = .gray
            copy.borderColor = .clear
            copy.textColor = .white
        }
        return copy
    }
    func click(_ click: (()->Void)?) -> Self{
        var copy = self
        copy.buttonClick = click
        return copy
    }
}

struct CustomButtonPreview: PreviewProvider {
    static var previews: some View {
        CustomButton()
            .setTitle(title: "import wallet")
            .setType(type: .clear)
    }
}
