//
//  MainNavigationController.swift
//  myAudible
//
//  Created by Mani Nomula on 12/3/17.
//  Copyright © 2017 Mani Nomula. All rights reserved.
//

import UIKit

class MainNavigationController:UINavigationController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if isLoggedIn(){
            let homeController = HomeController()
            viewControllers = [homeController]
        }else{
            perform(#selector(showLoginController),with:nil,afterDelay:0.01)
        }
    }
    
    fileprivate func isLoggedIn()->Bool{
        return UserDefaults.standard.isLoggedIn()
    }
    
    func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}

