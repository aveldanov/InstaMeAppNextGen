//
//  NotificationLikeEventTableViewCell.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 9/25/21.
//

import SDWebImage
import UIKit

protocol NotificationLikeEventTableViewCellDelegate: AnyObject{
    func didTapRelatedPostButton(model: UserNotification)
}


class NotificationLikeEventTableViewCell: UITableViewCell {

    static let identifier = "NotificationLikeEventTableViewCell"

    weak var delegate: NotificationLikeEventTableViewCellDelegate?
    
    private var model: UserNotification?
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .tertiarySystemBackground
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "@Anton like your photo"
        return label
    }()
    
    private let postButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "test"), for: .normal)
        return button
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        contentView.addSubview(label)
        contentView.addSubview(postButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // photo, text, postButton
        
        profileImageView.frame = CGRect(x: 3,
                                        y: 3,
                                        width: contentView.height-6,
                                        height: contentView.height-6)
        profileImageView.layer.cornerRadius = profileImageView.height/2
        
        let size = contentView.height-4
        postButton.frame = CGRect(x: contentView.width-size,
                                  y: 2,
                                  width: size,
                                  height: size)
        
        label.frame = CGRect(x: profileImageView.right,
                             y: 0,
                             width: contentView.width-size-profileImageView.width-6,
                             height: contentView.height)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImageView.image = nil
        postButton.setBackgroundImage(nil, for: .normal)
        label.text = nil
    }
    
    public func configure(with model: UserNotification){
        self.model = model
        
        switch model.type{
        case .like(post: let post):
            let thumbnailURL = post.thumbNailImageURL
            postButton.sd_setBackgroundImage(with: thumbnailURL,
                                             for: .normal,
                                             completed: nil)
        case .follow:
            break
        }
        
        label.text = model.text
        profileImageView.sd_setImage(with: model.user.profilePhoto, completed: nil)
    }
}