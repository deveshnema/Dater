//
//  LoginGuideViewController.swift
//  Dater
//
//  Created by Devesh Nema on 5/26/18.
//  Copyright © 2018 Devesh Nema. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginGuideViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, FBSDKLoginButtonDelegate {
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.alwaysBounceHorizontal = false
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = .yellow
        pc.numberOfPages = self.pages.count
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    lazy var loginButton : FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.delegate = self
        button.removeConstraints(button.constraints)
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.readPermissions = ["email", "public_profile"]
        return button
    }()
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        //showSwipeViewController()
        showProfileViewController()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    
    let guidecellid = "guidecellid"
    
    let pages: [Page] = {
        let firstPage = Page(title: "Discover", message: "Find new and interesting people from around you", imageName: "page1")
        let secondPage = Page(title: "Swipe", message: "Swipe right to like and left to pass", imageName: "page2")
        let thirdPage = Page(title: "Match", message: "If they also swipe right, its a match!", imageName: "page3")
        let fourthPage = Page(title: "Message", message: "You can start messaging once its a match", imageName: "page4")

       return [firstPage, secondPage, thirdPage, fourthPage]
    }()
    
    @objc func showProfileViewController() {
        let layout = UICollectionViewFlowLayout()
        let profileVC = ProfileViewController(collectionViewLayout: layout)
        present(profileVC, animated: true) {
        }
    }

    
    @objc func showSwipeViewController() {
        present(SwipeViewController(), animated: true) {
        }
        //navigationController?.viewControllers = [SwipeViewController()]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        collectionView.register(LoginGuideCell.self, forCellWithReuseIdentifier: guidecellid)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: guidecellid, for: indexPath) as! LoginGuideCell
        cell.page = pages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(loginButton)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        pageControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -10).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pagenumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pagenumber
    }

}














