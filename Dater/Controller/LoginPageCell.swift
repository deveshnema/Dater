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
    
    var page: Page? {
        didSet {
            guard let page = page else {
                return
            }
            imageView.image = UIImage(named: page.imageName)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor : UIColor(white: 0.2, alpha: 1)])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor : UIColor(white: 0.2, alpha: 1)]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
        }
    }
    
    let imageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "page1")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let textView : UITextView = {
        let tv = UITextView()
        tv.text = "SAMPLE TEXT FOR NOW"
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.isSelectable = false
        tv.textContainerInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    func setupViews() {
        backgroundColor = UIColor.yellow
        addSubview(imageView)
        addSubview(textView)
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        textView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3).isActive = true
    }
    
}
