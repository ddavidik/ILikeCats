//
//  UiNavigationController.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 07.06.2023.
//

import UIKit

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
    }
}
