//
//  CollectionViewCell.swift
//  CardView
//
//  Created by swstation on 8/20/18.
//  Copyright © 2018 swstation. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var title: UILabel!
    
    @IBOutlet private weak var pink: UILabel!
    @IBOutlet private weak var mainImage: UIImageView!
    
    @IBOutlet private weak var labelDescription: UILabel!

    @IBOutlet private weak var userName: UILabel!
    
    @IBOutlet private weak var UserAction: UILabel!
    @IBOutlet private weak var rating: UILabel!
    @IBOutlet private weak var imageUser: UIImageView!
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        setupUI()
    }
    
    private func setupUI() {
        layer.cornerRadius = 7
//        contentView.layer.cornerRadius = 4.0
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        mainImage.contentMode = .scaleToFill
        imageUser.backgroundColor = UIColor.lightGray
        imageUser.layer.cornerRadius = 10.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
       //contentView.layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    func setup(from post: Post) {
        userName.text = post.userName
        title.text = post.titleText
        mainImage.image = post.newsImage
        labelDescription.text = post.description
    }
    
}
