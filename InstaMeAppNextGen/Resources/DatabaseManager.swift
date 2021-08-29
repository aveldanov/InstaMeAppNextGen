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
        
        completion(true)
        
        
    }


    /// Insert new data into DB
    /// Parameters:
    /// - Parameter username: String representing username
    /// - Parameter email: String representing email
    /// - Parameter completion: Async callback for database

    public func insertNewUser(with email: String, username: String,completion: @escaping (Bool)->Void){
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil{
                //success
                completion(true)
                return
            }else{
                //failure
                completion(false)
                return
            }
        }
    } 
}
