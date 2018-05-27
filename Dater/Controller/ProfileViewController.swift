//
//  ProfileViewController.swift
//  Dater
//
//  Created by Devesh Nema on 5/26/18.
//  Copyright © 2018 Devesh Nema. All rights reserved.
//

import UIKit

private let headerid = "headerid"

class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        navigationItem.title = "Profile Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let imageGridNib = UINib(nibName: "ImageGrid", bundle: nil)
        collectionView?.register(imageGridNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerid)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerid, for: indexPath)
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width)
    }

   

   
  
}
