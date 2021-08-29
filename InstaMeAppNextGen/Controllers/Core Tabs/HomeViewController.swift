//
//  ViewController.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 8/22/21.
//
import Firebase
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        do {
//            try Firebase.Auth.auth().signOut()
//        } catch{
//                print("failed to sign out")
//            
//        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    }
    
    
    private func handleNotAuthenticated(){
        // check auth status
        if Auth.auth().currentUser == nil{
            // Show login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false, completion: nil)
        }
        
    }

}

