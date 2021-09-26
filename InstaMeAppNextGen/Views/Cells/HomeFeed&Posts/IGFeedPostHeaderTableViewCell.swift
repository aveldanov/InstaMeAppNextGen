//
//  IGFeedPostHeaderTableViewCell.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 9/1/21.
//

import UIKit

class IGFeedPostHeaderTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostHeaderTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBlue

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureIGFeedCell(){
        // configure cell
        
        
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
