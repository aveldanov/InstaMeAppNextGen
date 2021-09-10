//
//  StorageManager.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 8/23/21.
//

import Firebase
import Foundation


public class StorageManager{
    
    static let shared =  StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error {
        case failedToDownload
    }
    
    
     //MARK: Public
    //result will return URL of newly uploaded image
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>)->Void){

    }
    
    // return url to the post
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStorageManagerError>)->Void){
        bucket.child(reference).downloadURL { url, error in
            guard let url = url, error == nil else{
                completion(.failure(.failedToDownload))
                return
            }
            
            completion(.success(url))
        }
        
        
    }
}


public enum UserPostType{
    case photo, video
}


/// Represents User Post
public struct UserPost {
    let postID: String
    let postType: UserPostType
    let thumbNailImageURL: URL
    let postURL: URL  // either video URL or photo
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
}


struct PostLike{
    let username: String
    let likeID: String
}

struct CommentLike{
    let username: String
    let commentLikeID: String
}

struct PostComment{
    let commentID: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}
