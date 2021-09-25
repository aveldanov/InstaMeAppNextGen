//
//  UserFollowTableViewCell.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 9/20/21.
//

import UIKit

// AnyObject allows to have weak property
// we need week to avoid strong refence causing memory leak
protocol UserFollowTableViewCellDelegate: AnyObject {
    func didTapFollowUnfollowButton(model: String)
}

class UserFollowTableViewCell: UITableViewCell {
    static let identifier = "UserFollowTableViewCell"
    
    public weak var delegate: UserFollowTableViewCellDelegate?
    
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "Anton"
        
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "@anton"

        return label
    }()
    
    private let followButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(followButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = 5
        
        profileImageView.frame = CGRect(x: 3,
                                        y: 3,
                                        width: contentView.height - 6,
                                        height: contentView.height - 6)
        
        profileImageView.layer.cornerRadius = profileImageView.height/2.0

        let buttonWidth = contentView.width > 500 ? 220.0 : contentView.width
        
        followButton.frame = CGRect(x: contentView.width-5-buttonWidth,
                                    y: 5,
                                    width: buttonWidth,
                                    height: contentView.height-10)
        
        
        
        let labelHeight = contentView.height/2
        nameLabel.frame = CGRect(x: profileImageView.right+5,
                                 y: 0,
                                 width: contentView.width-8-profileImageView.width-buttonWidth,
                                 height: labelHeight)
        usernameLabel.frame = CGRect(x: profileImageView.right+5,
                                     y: nameLabel.bottom,
                                 width: contentView.width-8-profileImageView.width-buttonWidth,
                                 height: labelHeight)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        usernameLabel.text = nil
        followButton.setTitle(nil, for: .normal)
        followButton.backgroundColor = nil
        followButton.layer.borderWidth = 0
    }
    
    
    public func configure(with model: String){
        
        
        
    }
    
    
    

}
