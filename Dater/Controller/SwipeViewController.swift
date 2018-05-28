//
//  SwipeViewController.swift
//  Dater
//
//  Created by Devesh Nema on 5/27/18.
//  Copyright © 2018 Devesh Nema. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Swipe to match"
        view.backgroundColor = UIColor.red
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(showProfileViewController))
    }
    
    @objc func showProfileViewController() {
        let layout = UICollectionViewFlowLayout()
        let profileVC = ProfileViewController(collectionViewLayout: layout)
        navigationController?.pushViewController(profileVC, animated: true)
        
    }

  

}
