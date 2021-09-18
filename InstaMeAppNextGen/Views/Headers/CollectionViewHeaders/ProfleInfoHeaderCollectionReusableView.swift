//
//  ProfleInfoHeaderCollectionReusableView.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 9/5/21.
//

import UIKit

class ProfleInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfleInfoHeaderCollectionReusableView"
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    
    private let postsButtom: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let follwoingButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    

    
     //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBlue
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }

    
}
