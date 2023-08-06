//
//  CustomPicker.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import SwiftUI

struct CustomPicker: View {
    weak var navigation: CustomNavigationController?
    @State private var isDatePickerShown = false
        @State private var selectedDate = Date()
        
        var body: some View {
        ZStack {
            Button(action: {
                isDatePickerShown.toggle()
            }) {
                Text("날짜 선택: \(formattedDate(selectedDate))")
                    .padding()
                    .foregroundColor(.blue)
            }
            .padding()
            
            if isDatePickerShown {
                VStack {
                    Spacer()
                    DatePicker("날짜를 선택하세요", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.wheel)
                        .padding()
                    
                    Button("확인") {
                        withAnimation {
                            isDatePickerShown = false
                        }
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                .frame(height: 500)
            }
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }


}

struct CustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPicker()
    }
}
