//
//  IGFeedPostTableViewCell.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 8/31/21.
//

import UIKit
import SDWebImage

/// Cell for post content
final class IGFeedPostTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostTableViewCell"
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = nil
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondarySystemBackground
        
        contentView.addSubview(postImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        postImageView.frame = contentView.bounds
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
        
    }
    
    // configure cell

    public func configureIGFeedCell(with post: UserPost){
        imageView?.image = UIImage(named: "test")
        
        switch post.postType{
        case .photo:
            break
        case .video:
            break
            
            
            
            
        }
        
        
        
    }
    
}
