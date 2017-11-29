//
//  ViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/7/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //outlet for login button when app loads up
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginButton.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loginTapped(_ sender: Any) {
        //TODO: Here, perform log in with tabbed controller
        
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        mainTabController.selectedViewController = mainTabController.viewControllers?[1]
        present(mainTabController, animated: true, completion: nil)
        
        //change index from first stab to middle - last one             
        
    }
    
    
    
    
    
    
    
    
    
}

