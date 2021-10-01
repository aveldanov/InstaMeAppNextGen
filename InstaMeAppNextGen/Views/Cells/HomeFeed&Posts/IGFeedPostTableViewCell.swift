//
//  IGFeedPostTableViewCell.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 8/31/21.
//

import UIKit
import SDWebImage
import AVFoundation

/// Cell for post content
final class IGFeedPostTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostTableViewCell"
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = nil
        return imageView
    }()
    
    private var player: AVPlayer?
    // layer for video
    private var playerLayer = AVPlayerLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondarySystemBackground
        //!layer has to come first!
        contentView.layer.addSublayer(playerLayer)
        contentView.addSubview(postImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        postImageView.frame = contentView.bounds
        playerLayer.frame = contentView.bounds
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
        
    }
    
    // configure cell

    public func configureIGFeedCell(with post: UserPost){
        imageView?.image = UIImage(named: "test")
        
        return
        switch post.postType{
        case .photo:
            postImageView.sd_setImage(with: post.postURL, completed: nil)
        case .video:
            player = AVPlayer(url: post.postURL)
            playerLayer.player?.volume = 0 //default volume
            playerLayer.player?.play()
        }
        
        
        
    }
    
}
