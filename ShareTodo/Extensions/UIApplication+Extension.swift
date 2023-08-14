//
//  UIApplication+Extension.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/14.
//

import UIKit
import SwiftUI

extension UIApplication {
     func dismissKeyboard() {
         sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
     }
    
    func createTabBar(index: Int){
        let sceneDelegate = connectedScenes
                .first!.delegate as! SceneDelegate
        let tabBar = TabBarController()
        tabBar.selectedIndex = index
        sceneDelegate.window!.rootViewController = tabBar
    }
}
