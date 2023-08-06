//
//  CustomTextFieldConfig.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/05.
//

import SwiftUI

final class CustomTextFieldConfig {
    static var shared = CustomTextFieldConfig()
    private init() {}
    
    //Title
    var defaultTitleFont: Font = .callout
    var defaultTitleTextColor: Color = .black
    
    //Border
    var defaultBorderColor: Color = .black
    var defaultBorderWidth: CGFloat = 1
    var defaultBorderCornerRadius: CGFloat = 12
    
    //TextField
    var defaultTextColor: Color = .black
    var defaultTextFont: Font = .body
    var defaultTextViewBackground: Color = .white
    
    //PlaceHolder
    var defaultPlaceHolderTextFont: Font = .body
    var defaultPlaceHolderTextColor: Color = .gray
    
    //Error
    var defaultErrorTextFont: Font = .footnote
    var defaultErrorBorderColor: Color = .red
}
