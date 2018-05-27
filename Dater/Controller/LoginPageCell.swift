//
//  LoginPageCell.swift
//  Dater
//
//  Created by Devesh Nema on 5/26/18.
//  Copyright © 2018 Devesh Nema. All rights reserved.
//

import UIKit

class LoginPageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "page1")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    func setupViews() {
        backgroundColor = UIColor.yellow
        addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
}
