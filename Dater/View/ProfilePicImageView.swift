//
//  ProfilePicImageView.swift
//  Dater
//
//  Created by Devesh Nema on 5/26/18.
//  Copyright © 2018 Devesh Nema. All rights reserved.
//

import UIKit

class ProfilePicImageView: UIImageView {
    @IBInspectable
    var index: NSNumber! {
        didSet {
            let imageName = "ironman\(index.stringValue)"
            self.image = UIImage(named: imageName)
            layer.cornerRadius = 5
        }
    }
}
