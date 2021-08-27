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
    
    public func registerNewUser(username: String, email: String, password: String){
        
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: (Bool)->Void){
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
