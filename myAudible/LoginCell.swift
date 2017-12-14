//
//  File.swift
//  myAudible
//
//  Created by Mani Nomula on 12/3/17.
//  Copyright © 2017 Mani Nomula. All rights reserved.
//

import UIKit

class LoginCell: UICollectionViewCell {
    
    
    let logoImageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"logo")
        return iv
    }()
    
    let emailTextField:LeftpaddedTextField = {
        let tf = LeftpaddedTextField()
        tf.placeholder = "Enter email"
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    let passowordTextField:LeftpaddedTextField = {
        let tf = LeftpaddedTextField()
        tf.placeholder = "Enter password"
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var loginButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    weak var delegate:LoginControllerDelegate?
    
    func handleLogin(sender:UIButton) {
        print("hellogcdxszsxcvbhnmjmkjnhjbvgfcd")
        delegate?.finishLoggingIn()
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
        
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passowordTextField)
        addSubview(loginButton)
        
        _=logoImageView.anchor(centerYAnchor, left: nil, bottom: nil, right:nil, topConstant: -230, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        _=emailTextField.anchor(logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        _=passowordTextField.anchor(emailTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        _=loginButton.anchor(passowordTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LeftpaddedTextField:UITextField{
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x+10, y: bounds.origin.y, width: bounds.width+10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x+10, y: bounds.origin.y, width: bounds.width+10, height: bounds.height)
    }
    
}
