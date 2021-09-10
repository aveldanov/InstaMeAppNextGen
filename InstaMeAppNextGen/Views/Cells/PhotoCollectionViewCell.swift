//
//  PhotoCollectionViewCell.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 9/5/21.
//

import SDWebImage
import UIKit


class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        
        
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.frame = contentView.bounds
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        
        // accessablity strings to be read aloud
        accessibilityLabel = "User post image"
        accessibilityHint = "Double-tap to open post"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// Using SDWebImage CocoaPod to deal with Image Caching
    public func configure(with model: UserPost){
        // CONVENTIONAL WAY TO LOAD
//        URLSession.shared.dataTask(with: thumbNailURL) { data, response, error in
//            photoImageView.image = UIImage(data: data!)
//        }
        let url = model.thumbNailImageURL
        photoImageView.sd_setImage(with: url, completed: nil)

    }
    
    // test purpose
    public func configure(debug imageName: String){
        photoImageView.image = UIImage(named: imageName)
        
    }
}
