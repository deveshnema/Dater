//
//  MainNavigationController.swift
//  Dater
//
//  Created by Devesh Nema on 5/27/18.
//  Copyright © 2018 Devesh Nema. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let isUserLoggedIn = true
        
        if isUserLoggedIn {
            let swipeVC = SwipeViewController()
            viewControllers = [swipeVC]
        } else {
            perform(#selector(showLoginGuide), with: nil, afterDelay: 0.01)
        }
    }

    @objc func showLoginGuide() {
        let lgVC = LoginGuideViewController()
        present(lgVC, animated: true) {
        }
    }

}
