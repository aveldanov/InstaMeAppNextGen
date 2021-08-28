//
//  DatabaseManager.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 8/23/21.
//

import Firebase
import Foundation


public class DatabaseManager{
    
    static let shared =  DatabaseManager()

    private let database = Database.database().reference()
    
     //MARK: Public
    
    /// Checks if username and email is available
    /// Parameters:
    /// - Parameter username: String representing username
    /// - Parameter email: String representing email

    public func canCreateNewUser(with email: String, username: String, completion: (Bool)->Void ){
        
        
        
        
    }
    /// Insert new data into DB
    /// Parameters:
    /// - Parameter username: String representing username
    /// - Parameter email: String representing email
    /// - Parameter completion: String representing email

    public func insertNewUser(with email: String, username: String,completion: @escaping (Bool)->Void){
        
        
        database.child(email).setValue(["username": username]) { error, _ in
            if error == nil{
                completion(true)
                return
            }else{
                completion(false)
                return
            }
        }
        
    }
    
    
    
}
