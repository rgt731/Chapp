//
//  MainTabController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/7/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import Foundation
import UIKit


class MainTabController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //set bottom of navigation background color
        self.tabBar.barTintColor = UIColor.init(red: 148/255.0, green: 0/255.0, blue: 63/255.0, alpha: 1.0)
 
    }
}





