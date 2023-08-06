//
//  CustomToggle.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import SwiftUI

struct CustomToggle: View {
    var isOn: Binding<Bool>
    var toggleTitle: String?
    
    var body: some View {
        Toggle(isOn: isOn) {
            HStack {
                Spacer()
                Text(toggleTitle ?? "")
            }
        }.toggleStyle(SwitchToggleStyle(tint: .red))
    }
}

extension CustomToggle {
    func setTitle(_ text: String?) -> Self {
        var copy = self
        copy.toggleTitle = text
        return copy
    }
}

struct CustomToggle_Previews: PreviewProvider {
    static var previews: some View {
        CustomToggle(isOn: .constant(true))
            .setTitle("asdfiojsadfoji")
    }
}
