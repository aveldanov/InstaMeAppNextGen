//
//  ProfileTabsCollectionReusableView.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 9/5/21.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
        static let identifier = "ProfileTabsCollectionReusableView"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemOrange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
