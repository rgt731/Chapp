//
//  ViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/7/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //fields for username and password
    @IBOutlet weak var userNameTextbox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var errorMessageIndicator: UILabel!
    
    //outlet for login button when app loads up
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginButton.layer.cornerRadius = 5.0
       // self.hideKeyboardWhenTappedAround()
        errorMessageIndicator.isHidden = true
        
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dismissViewController(_ sender: Any) {
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        //TODO: Here, perform log in with tabbed controller
        
        //indicates which tab bar icon is intiaially highlighted and displayed
       let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        
        //change index from first tab to middle - last one
        mainTabController.selectedViewController = mainTabController.viewControllers?[1]
        present(mainTabController, animated: true, completion: nil)
        
        
        //authenticate username and password
        let username = "username"
        let password = "password"
        
        if userNameTextbox.text == username && passwordTextBox.text == password
        {
            errorMessageIndicator.isHidden = true
            let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
            
            mainTabController.selectedViewController = mainTabController.viewControllers?[1]
            print("password and username was correct")
            
            present(mainTabController, animated: true, completion: nil)
        }
        else
        {
            errorMessageIndicator.isHidden = false
            errorMessageIndicator.text = " Incorrect Username or Password"
            userNameTextbox.resignFirstResponder()
            passwordTextBox.resignFirstResponder()
            
        }

        
    }
    
    
    
    
    
}

//this extension will make the keyboard dissappear on touch and alert messages
extension UIViewController{
    func hideKeyboardWhenTappedAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(UIViewController.dismissKeyBoard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
      
    @objc func dismissKeyBoard(){
        view.endEditing(true)
    }
    
    func date() -> String{
    let date = Date()
    let formatter = DateFormatter()
    
    formatter.dateFormat = "(dd/MM/YY)"
    
    let result = formatter.string(from: date)
    return result
    }
    
}
       







