//
//  IGFeedPostActionsTableViewCell.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 9/1/21.
//

import UIKit

class IGFeedPostActionsTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostActionsTableViewCell"
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(sendButton)
        
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(didTapCommentButton), for: .touchUpInside)
        sendButton.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        //like, comment, send
        
        let buttonSize = contentView.height-10
        let buttons = [likeButton, commentButton, sendButton]
        
        for i in 0..<buttons.count{
            let button = buttons[i]
            // x = size + buffer
            button.frame = CGRect(x: (CGFloat(i)*buttonSize)+(10*CGFloat(i+1)),
                                  y: 5,
                                  width: buttonSize,
                                  height: buttonSize)
            }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
     //MARK: Actions
    
    
    @objc func didTapLikeButton(){
        
        
    }
    
    @objc func didTapCommentButton(){
        
        
    }
    
    @objc func didTapSendButton(){
        
        
    }
    
    
    
    
    public func configureIGFeedCell(with model: UserPost){
        // configure cell

        
    }
}
