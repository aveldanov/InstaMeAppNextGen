//
//  ProfleInfoHeaderCollectionReusableView.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 9/5/21.
//

import UIKit

class ProfleInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfleInfoHeaderCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBlue
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
