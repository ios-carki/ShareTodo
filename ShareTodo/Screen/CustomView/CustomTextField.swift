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
    
    //Secure
    var isSecureField: Bool = false
    @State var isSecure: Bool = false
    var secureButtonColor: Color = CustomTextFieldConfig.shared.defaultSecureButtonColor
    
    var body: some View {
        VStack(spacing: 8) {
            if let titleText {
                Text(titleText)
                    .font(titleFont)
                    .foregroundColor(titleTextColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    if isSecure {
                        SecureField(text: text) {
                            Text(placeHolderText ?? "")
                                .foregroundColor(placeHolderTextColor)
                                .font(placeHolderTextFont)
                        }
                    } else {
                        TextField(text: text) {
                            Text(placeHolderText ?? "")
                                .foregroundColor(placeHolderTextColor)
                                .font(placeHolderTextFont)
                        }
                    }
                    
                    Spacer()
                    
                    if isSecureField {
                        VStack {
                            Image(systemName: (isSecure) ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor(secureButtonColor)
                        }
                        .frame(width: 28, height: 50)
                        .padding(.trailing, 4)
                        .onTapGesture {
                            print(isSecure)
                            isSecure.toggle()
                        }
                    }
                }
            }
            .foregroundColor(textColor)
            .font(textFont)
            .padding(.horizontal, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 50)
            .background(textViewBackground)
            .cornerRadius(borderCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: borderCornerRadius)
                    .inset(by: 0.5)
                    .stroke(error?.wrappedValue == true ? errorBorderColor : borderColor, lineWidth: borderWidth)
            )
            
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
    //Title
    func setTitleText(_ title: String?) -> Self {
        var copy = self
        copy.titleText = title
        return copy
    }
    
    func setTitleTextFont(_ font: Font) -> Self {
        var copy = self
        copy.titleFont = font
        return copy
    }
    
    func setTitleTextColor(_ color: Color) -> Self {
        var copy = self
        copy.titleTextColor = color
        return copy
    }
    
    //Border
    func setBorderColor(color: Color) -> Self {
        var copy = self
        copy.borderColor = color
        return copy
    }
    
    func setBorderWidth(width: CGFloat) -> Self {
        var copy = self
        copy.borderWidth = width
        return copy
    }
    
    func setCornerRadius(_ radius: CGFloat) -> Self {
        var copy = self
        copy.borderCornerRadius = radius
        return copy
    }
    
    //TextField
    func setTextColor(color: Color)-> Self {
        var copy = self
        copy.textColor = color
        return copy
    }
    
    func setTextFont(font: Font) -> Self {
        var copy = self
        copy.textFont = font
        return copy
    }
    
    func setBackgroundColor(backgroundColor: Color) -> Self {
        var copy = self
        copy.textViewBackground = backgroundColor
        return copy
    }
    
    //PlaceHolder
    func setPlaceHolderText(_ text: String?) -> Self {
        var copy = self
        copy.placeHolderText = text
        return copy
    }
    
    func setPlaceHolderTextFont(font: Font) -> Self {
        var copy = self
        copy.placeHolderTextFont = font
        return copy
    }
    
    func setPlaceHolderTextColor(color: Color) -> Self {
        var copy = self
        copy.placeHolderTextColor = color
        return copy
    }
    
    //Error
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
    
    func setErrorTextFont(font: Font) -> Self {
        var copy = self
        copy.errorTextFont = font
        return copy
    }
    
    func setErrorBorderColor(color: Color) -> Self {
        var copy = self
        copy.errorBorderColor = color
        return copy
    }
    
    //Secure
    func setSecureField(_ secure: Bool) -> Self {
        var copy = self
        copy._isSecure = State(initialValue: secure)
        copy.isSecureField = secure
        return copy
    }
    
    func setSecureButtonColor(color: Color) -> Self {
        var copy = self
        copy.secureButtonColor = color
        return copy
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.indigo
            VStack {
                CustomTextField(text: .constant(""))
                    .setTitleText("asfdgij")
                    .setPlaceHolderText("asdfg")
                    .setSecureButtonColor(color: .red)
                    .setSecureField(true)
                
                CustomTextField(text: .constant(""))
                    .setSecureButtonColor(color: .red)
                    .setPlaceHolderTextColor(color: .blue)
                    .setPlaceHolderText("afsdsdfa")
                    
            }
        }
    }
}
