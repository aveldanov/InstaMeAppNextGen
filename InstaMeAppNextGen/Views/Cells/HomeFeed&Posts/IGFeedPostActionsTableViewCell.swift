//
//  IGFeedPostActionsTableViewCell.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 9/1/21.
//

import UIKit

class IGFeedPostActionsTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostActionsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGreen

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
