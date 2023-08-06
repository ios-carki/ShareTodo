//
//  CustomNavigationController.swift
//  Portfolio
//
//  Created by Carki on 2023/07/29.
//

import Foundation
import UIKit
import SwiftUI

class CustomNavigationController: UINavigationController,UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        //let item = UIBarButtonItem(title: "", image: UIImage(systemName: "arrowtriangle.backward.fill"), style: .plain, target: nil, action: nil)
        let backButtonImage = UIImage(systemName: "arrowtriangle.backward.fill")
        // Set custom back button image
        viewController.navigationController?.navigationBar.backIndicatorImage = backButtonImage
        viewController.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage

        // Hide the default back button title
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem?.tintColor = .white
    }
    
    @objc func handleBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

