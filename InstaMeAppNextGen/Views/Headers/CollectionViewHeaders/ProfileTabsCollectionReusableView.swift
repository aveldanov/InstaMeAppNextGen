//
//  ProfileTabsCollectionReusableView.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 9/5/21.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
        static let identifier = "ProfileTabsCollectionReusableView"
    
    private let gridButton: UIButton = {
       let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemBlue
        button.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        return button
    }()
    
    private let tagButton: UIButton = {
       let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .secondarySystemBackground
        button.setBackgroundImage(UIImage(systemName: "tag"), for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
