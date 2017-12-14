//
//  UserDefault+Helpers.swift
//  myAudible
//
//  Created by Mani Nomula on 12/4/17.
//  Copyright © 2017 Mani Nomula. All rights reserved.
//

import Foundation

extension UserDefaults{
    
    enum userDefaultKeys:String{
        case isLoggedIn
    }
    
    func setIsLoggedIn(value:Bool){
        set(value, forKey: userDefaultKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn()->Bool{
        return bool(forKey: userDefaultKeys.isLoggedIn.rawValue)
    }

}
