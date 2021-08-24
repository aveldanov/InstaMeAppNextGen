//
//  LoginViewController.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 8/23/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        //buffer
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        //buffer
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor

        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    
    private let termsButton: UIButton = {
        
        
        return UIButton()
    }()
    
    private let privacyButton: UIButton = {
        
        
        return UIButton()
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backGroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backGroundImageView)
        
        return header
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        usernameEmailField.delegate = self
        passwordField.delegate = self
        addSubviews()
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // assign frames
        
        
        headerView.frame = CGRect(x: 0,
                                  y: 0.0,
                                  width: view.width,
                                  height: view.height/3.0
        )
        
        usernameEmailField.frame = CGRect(x: 25,
                                          y: headerView.bottom+10,
                                          width: view.width-50,
                                          height: 52.0
        )
        
        passwordField.frame = CGRect(x: 25,
                                     y: usernameEmailField.bottom+10,
                                     width: view.width-50,
                                     height: 52.0
        )
        
        loginButton.frame = CGRect(x: 25,
                                   y: passwordField.bottom+10,
                                   width: view.width-50,
                                   height: 52.0
        )
        
        createAccountButton.frame = CGRect(x: 25,
                                           y: loginButton.bottom+10,
                                           width: view.width-50,
                                           height: 52.0
        )

        
        
        
        configureHeaderView()
        
    }
    
    private func configureHeaderView(){
        //when nothing is added
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        // add logo
        
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width/2.0,
                                 height: headerView.height - view.safeAreaInsets.top
        )
    }
    
    private func addSubviews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
        
        
    }
    
    
    @objc private func didTapLoginButton(){
        
    }
    
    @objc private func didTapTermsButton(){
        
    }
    
    @objc private func didTapPrivacyButton(){
        
    }
    
    @objc private func didTapCreateAccount(){
        
    }
    
    
}


extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField{
            passwordField.becomeFirstResponder()
        }else{
            didTapLoginButton()
        }
        
        
        
        return true
    }
    
    
}
