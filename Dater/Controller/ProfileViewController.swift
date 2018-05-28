//
//  ProfileViewController.swift
//  Dater
//
//  Created by Devesh Nema on 5/26/18.
//  Copyright © 2018 Devesh Nema. All rights reserved.
//

import UIKit

private let headerid = "headerid"
private let cellid = "cellid"

class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        //collectionView?.alwaysBounceVertical = true
        navigationItem.title = "Profile Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "logout"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "couple"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(showSwipeViewController))
        
        let imageGridNib = UINib(nibName: "ImageGrid", bundle: nil)
        collectionView?.register(imageGridNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerid)
        
        collectionView?.register(ProfileCell.self, forCellWithReuseIdentifier: cellid)
    }
    
    @objc func signOut() {
        present(LoginGuideViewController(), animated: true) {
        }
    }
    
    @objc func showSwipeViewController() {
        navigationController?.pushViewController(SwipeViewController(), animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerid, for: indexPath)
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! ProfileCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}

class ProfileCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let textView : UITextView = {
        let tv = UITextView()
        tv.isScrollEnabled = false
        
        let attributedText = NSMutableAttributedString(string: "About-me", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20)])
        
        attributedText.append(NSAttributedString(string: "\nMy armor was never a distraction or a hobby, it was a cocoon, and now I'm a changed man. You can take away my house, all my tricks and toys, but one thing you can't take away - I am Iron Man", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)]))
        
        
        tv.attributedText = attributedText
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textContainerInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tv.backgroundColor = UIColor.white
        return tv
    }()
    
    let dividerLine : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let distanceLabel : UILabel = {
        let label = UILabel()
        label.text = "Distance: 80m"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let distanceSlider : UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 80
        slider.tintColor = UIColor.red
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(updateDistanceLabel), for: UIControlEvents.valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    @objc func updateDistanceLabel() {
        distanceLabel.text = "Distance: \(distanceSlider.value)m"
    }
    
    func setupViews() {
        backgroundColor = UIColor.white
        addSubview(textView)
        addSubview(dividerLine)
        addSubview(distanceLabel)
        addSubview(distanceSlider)
        
        textView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        dividerLine.topAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        dividerLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        dividerLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true

        distanceLabel.topAnchor.constraint(equalTo: dividerLine.bottomAnchor, constant: 10).isActive = true
        distanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        distanceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14).isActive = true
        distanceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        distanceSlider.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 15).isActive = true
        distanceSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        distanceSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        distanceSlider.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
    
}

























