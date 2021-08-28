//
//  AuthManager.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 8/23/21.
//

import Firebase
import Foundation


public class AuthManager{
    
    static let shared =  AuthManager()
    
     //MARK: Public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping(Bool)->()){
        /*
         check if username is available
         check if email is available
         create account
         insert account to DB
         
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate{
                /*
                 create account
                 insert account to DB
                 */
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard result != nil, error == nil else{
                        //Firebase could not create accout
                        completion(false)
                        return
                    }
                    // Insert into database
                    
                    
                }
            }else{
                //either email or username does not exist
                completion(false)
                
            }
            
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool)->Void){
        if let email = email{
            // email login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }
        }else if let username = username{
            // username login
            print(username)
        }
    }
}
