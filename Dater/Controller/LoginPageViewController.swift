//
//  LoginPageViewController.swift
//  Dater
//
//  Created by Devesh Nema on 5/26/18.
//  Copyright © 2018 Devesh Nema. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.red
        cv.alwaysBounceHorizontal = false
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let cellid = "cellid"
    
    let pages: [Page] = {
        let firstPage = Page(title: "Discover", message: "Find new and interesting people from around you", imageName: "page1")
        let secondPage = Page(title: "Swipe", message: "Swipe right to like and left to pass", imageName: "page2")
        let thirdPage = Page(title: "Match", message: "If they also swipe right, its a match!", imageName: "page3")
        let fourthPage = Page(title: "Message", message: "You can start messaging once its a match", imageName: "page4")

       return [firstPage, secondPage, thirdPage, fourthPage]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        collectionView.register(LoginPageCell.self, forCellWithReuseIdentifier: cellid)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! LoginPageCell
        cell.page = pages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}
