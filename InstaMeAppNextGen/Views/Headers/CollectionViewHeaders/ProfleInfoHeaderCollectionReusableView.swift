//
//  ProfleInfoHeaderCollectionReusableView.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 9/5/21.
//

import UIKit

protocol ProfleInfoHeaderCollectionReusableViewDelegate: AnyObject {
    
    
    
    
}

final class ProfleInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfleInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfleInfoHeaderCollectionReusableViewDelegate?

    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.setTitleColor(.label, for: .normal)

        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let follwoingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)

        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Your Profile", for: .normal)
        button.setTitleColor(.label, for: .normal)

        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    

    
     //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubviews()
        
        
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    
    
    private func addSubviews(){
        addSubview(profilePhotoImageView)
        addSubview(postsButton)
        addSubview(followersButton)
        addSubview(follwoingButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        //integral rounds down numbers
        profilePhotoImageView.frame = CGRect(
            x: 5,
            y: 5,
            width: profilePhotoSize,
            height: profilePhotoSize).integral
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0
        let countsButtonHeight = profilePhotoSize/2
        let countsButtonWidth = (width-10-profilePhotoSize)/3
        
        postsButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5,
            width: countsButtonWidth,
            height: countsButtonHeight).integral
        
        followersButton.frame = CGRect(
            x: postsButton.right,
            y: 5,
            width: countsButtonWidth,
            height: countsButtonHeight).integral
        
        follwoingButton.frame = CGRect(
            x: followersButton.right,
            y: 5,
            width: countsButtonWidth,
            height: countsButtonHeight).integral
        
        editProfileButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5 + countsButtonHeight,
            width: countsButtonWidth*3,
            height: countsButtonHeight).integral
    }

    
}
