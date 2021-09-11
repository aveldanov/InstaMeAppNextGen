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

