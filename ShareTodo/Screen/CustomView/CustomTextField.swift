//
//  CustomTextField.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/05.
//

import SwiftUI

struct CustomTextField: View {
    
    //Title
    var titleText: String?
    var titleFont: Font = CustomTextFieldConfig.shared.defaultTitleFont
    var titleTextColor: Color = CustomTextFieldConfig.shared.defaultTitleTextColor
    
    //Border
    var borderColor: Color = CustomTextFieldConfig.shared.defaultBorderColor
    var borderWidth: CGFloat = CustomTextFieldConfig.shared.defaultBorderWidth
    var borderCornerRadius: CGFloat = CustomTextFieldConfig.shared.defaultBorderCornerRadius
    
    //TextField
    var text: Binding<String>
    var textColor: Color = CustomTextFieldConfig.shared.defaultTextColor
    var textFont: Font = CustomTextFieldConfig.shared.defaultTextFont
    var textViewBackground: Color = CustomTextFieldConfig.shared.defaultTextViewBackground
    
    //PlaceHolder
    var placeHolderText: String?
    var placeHolderTextFont: Font = CustomTextFieldConfig.shared.defaultPlaceHolderTextFont
    var placeHolderTextColor: Color = CustomTextFieldConfig.shared.defaultPlaceHolderTextColor
    
    //Error
    var error: Binding<Bool>?
    var errorText: Binding<String>?
    var errorTextFont: Font = CustomTextFieldConfig.shared.defaultErrorTextFont
    var errorBorderColor: Color = CustomTextFieldConfig.shared.defaultErrorBorderColor
    
    
    var body: some View {
        VStack(spacing: 8) {
            if let titleText {
                Text(titleText)
                    .font(titleFont)
                    .foregroundColor(titleTextColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            RoundedRectangle(cornerRadius: borderCornerRadius)
                .stroke(error?.wrappedValue == true ? errorBorderColor : borderColor, lineWidth: borderWidth)
                .overlay(
                    TextField(placeHolderText ?? "", text: text)
                        .foregroundColor(textColor)
                        .font(textFont)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .padding(.horizontal, 8)
                )
                .frame(height: 50)
            
            if let error = error?.wrappedValue {
                if error {
                    HStack(spacing: 8) {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .frame(width: 14, height: 14, alignment: .leading)
                            .foregroundColor(.red)
                        
                        Text(errorText?.wrappedValue ?? "")
                            .foregroundColor(.red)
                            .font(errorTextFont)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                }
                
            }
        }
    }
}

extension CustomTextField {
    func setTitleText(_ title: String?) -> Self {
        var copy = self
        copy.titleText = title
        return copy
    }
    
    func setTitleTextColor(_ color: Color) -> Self {
        var copy = self
        copy.titleTextColor = color
        return copy
    }
    
    func setPlaceHolderText(_ text: String?) -> Self {
        var copy = self
        copy.placeHolderText = text
        return copy
    }
    
    func setCornerRadius(_ radius: CGFloat) -> Self {
        var copy = self
        copy.borderCornerRadius = radius
        return copy
    }
    
    func setError(_ error: Binding<Bool>?) -> Self {
        var copy = self
        copy.error = error
        return copy
    }
    
    func setErrorText(_ text: Binding<String>?) -> Self {
        var copy = self
        copy.errorText = text
        return copy
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.indigo
            VStack {
                CustomTextField(text: .constant("asd"))
                    .setTitleText("제목")
                    .setCornerRadius(12)
                    .setError(.constant(true))
                    .setErrorText(.constant("에러"))
                    .padding(.horizontal, 12)
            }
        }
    }
}
