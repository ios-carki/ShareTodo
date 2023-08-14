//
//  TabBarController.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/14.
//

import UIKit
import SwiftUI

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
        setupTabBar()
    }
    
    private func setupTabBar(){
        tabBar.tintColor = UIColor(Color.red)
        tabBar.unselectedItemTintColor = UIColor(Color.black)
        tabBar.backgroundColor = UIColor(Color.teal)
        tabBar.isTranslucent = true
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(Color.cyan)
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = UITabBar.appearance().standardAppearance
        }
        
        let tabBarItem1 = tabBar.items![0] as UITabBarItem
        let tabBarItem2 = tabBar.items![1] as UITabBarItem
        let tabBarItem3 = tabBar.items![2] as UITabBarItem

        tabBarItem1.selectedImage = UIImage(systemName: "person")
        tabBarItem2.selectedImage = UIImage(systemName: "globe")
        tabBarItem3.selectedImage = UIImage(systemName: "trash")

        tabBarItem1.title = "공유"
        tabBarItem2.title = "홈"
        tabBarItem3.title = "설정"
    }
    
    private func setupVC() {
        
        viewControllers = [
            create1(image: UIImage(systemName: "person")!),
            create2(image: UIImage(systemName: "globe")!),
            create3(image: UIImage(systemName: "trash")!)
        ]
    }
    
    private func create1(image: UIImage) -> UIViewController {
        let navController = CustomNavigationController()
        let hostingController = UIHostingController(rootView: ShareView(navigation: navController))
        navController.tabBarItem.title = nil
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        navController.pushViewController(hostingController, animated: true)
        return navController
    }
    
    private func create2(image: UIImage) -> UIViewController {
        let navController = CustomNavigationController()
        let hostingController = UIHostingController(rootView: MainView(navigation: navController))
        navController.tabBarItem.title = nil
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        navController.pushViewController(hostingController, animated: true)
        return navController
    }
    
    private func create3(image: UIImage) -> UIViewController {
        let navController = CustomNavigationController()
        let hostingController = UIHostingController(rootView: SettingView(navigation: navController))
        navController.tabBarItem.title = nil
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        navController.pushViewController(hostingController, animated: true)
        return navController
    }
}
