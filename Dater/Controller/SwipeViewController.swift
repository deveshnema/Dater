//
//  SwipeViewController.swift
//  Dater
//
//  Created by Devesh Nema on 5/27/18.
//  Copyright © 2018 Devesh Nema. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    var isShowingFirstCard = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Swipe to match"
        view.backgroundColor = UIColor.white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(showProfileViewController))
        
        setupViews()
    }
    
    @objc func showProfileViewController() {
        let layout = UICollectionViewFlowLayout()
        let profileVC = ProfileViewController(collectionViewLayout: layout)
        navigationController?.pushViewController(profileVC, animated: true)        
    }

    let backgroundImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "swipe_background")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let cardView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "card_mila")
        iv.isUserInteractionEnabled = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let cardView2 : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "card_olivia")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    
    let likenopeImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "like")
        iv.alpha = 0
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = false
        return iv
    }()
    
    @objc func handleCardSwipe(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)

        cardView.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        let deltaX = cardView.center.x - view.center.x

        //rotate the card
        //35 degress angle is 0.61 in radians
        let angle : CGFloat = 0.61
        let divisor = (view.frame.width/2) / angle
        cardView.transform = CGAffineTransform(rotationAngle: deltaX/divisor)
        
        //add like or nope images
        if deltaX > 0 {
            likenopeImage.image = UIImage(named: "like")
        } else {
            likenopeImage.image = UIImage(named: "nope")
        }
        
        //increase likenopeimage alpha
        likenopeImage.alpha = abs(deltaX) / view.center.x
        
        //once the pan ends
        if sender.state == UIGestureRecognizerState.ended {
            //move the card out of the screen
            if cardView.center.x < 75 {
                UIView.animate(withDuration: 0.3) {
                    self.cardView.center = CGPoint(x: self.cardView.center.x - 500, y: self.cardView.center.y + 100)
                    self.cardView.alpha = 0
                }
            } else if cardView.center.x > view.frame.width - 75 {
                UIView.animate(withDuration: 0.3) {
                    self.cardView.center = CGPoint(x: self.cardView.center.x + 500, y: self.cardView.center.y + 100)
                    self.cardView.alpha = 0
                }
            }
            
            UIView.animate(withDuration: 0.2) {
                self.cardView.center = self.view.center
                self.cardView.alpha = 1
                self.likenopeImage.alpha = 0
                self.cardView.transform = CGAffineTransform.identity
            }
        }
    }
    
    @objc func handleCardSwipe2(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        var topCard = cardView
        var bottomCard = cardView2

        if !isShowingFirstCard {
            topCard = cardView2
            bottomCard = cardView
        } else {
            topCard = cardView
            bottomCard = cardView2
        }
        
        topCard.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        let deltaX = topCard.center.x - view.center.x
        
        //rotate the card
        //35 degress angle is 0.61 in radians
        let angle : CGFloat = 0.61
        let divisor = (view.frame.width/2) / angle
        topCard.transform = CGAffineTransform(rotationAngle: deltaX/divisor)
        
        //add like or nope images
        if deltaX > 0 {
            likenopeImage.image = UIImage(named: "like")
        } else {
            likenopeImage.image = UIImage(named: "nope")
        }
        
        //increase likenopeimage alpha
        likenopeImage.alpha = abs(deltaX) / view.center.x
        
        //once the pan ends
        if sender.state == UIGestureRecognizerState.ended {
            //move the card out of the screen
            if topCard.center.x < 75 {
                UIView.animate(withDuration: 0.3) {
                    topCard.center = CGPoint(x: topCard.center.x - 500, y: topCard.center.y + 100)
                    topCard.alpha = 0
                }
            } else if topCard.center.x > view.frame.width - 75 {
                UIView.animate(withDuration: 0.3) {
                    topCard.center = CGPoint(x: topCard.center.x + 500, y: topCard.center.y + 100)
                    topCard.alpha = 0
                }
            }
            
            
            UIView.animate(withDuration: 0.0) {
                topCard.center = self.view.center
                topCard.alpha = 1
                topCard.transform = CGAffineTransform.identity
                self.likenopeImage.alpha = 0
                self.view.bringSubview(toFront: bottomCard)
                if !self.isShowingFirstCard {
                    self.isShowingFirstCard = true
                } else {
                    self.isShowingFirstCard = false
                }
            }
        }
    }
    
    
    func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(cardView2)
        view.addSubview(cardView)
        

        cardView.addSubview(likenopeImage)


        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cardView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleCardSwipe2(sender:))))

        cardView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        cardView2.heightAnchor.constraint(equalToConstant: 500).isActive = true
        cardView2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cardView2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cardView2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleCardSwipe2(sender:))))

        likenopeImage.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        likenopeImage.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
        likenopeImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        likenopeImage.heightAnchor.constraint(equalToConstant: 180).isActive = true

    }

}























