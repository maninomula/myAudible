//
//  HomeController.swift
//  myAudible
//
//  Created by Mani Nomula on 12/4/17.
//  Copyright © 2017 Mani Nomula. All rights reserved.
//

import UIKit

class HomeController:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "We're logged in"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Signout", style: .plain, target: self, action: #selector(handleSignout))
        
        let imageView = UIImageView(image: UIImage(named: "home"))
        view.addSubview(imageView)
        _=imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
    func handleSignout(){
        UserDefaults.standard.setIsLoggedIn(value: false)
        let loginCOntroller = LoginController()
        present(loginCOntroller, animated: true, completion: nil)
    }
}
