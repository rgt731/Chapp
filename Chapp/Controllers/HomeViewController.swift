//
//  HomeViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/17/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   //image to show failure or success
    @IBOutlet weak var failSuccessImage: UIImageView!
    
    //actual check in button
    @IBOutlet weak var checkInButtion: UIButton!
    
    //function for when the check in button is clicked
    @IBAction func homeButtonClicked(_ sender: UIButton) {
        
       // checkInButtion.currentImage = UIImage(named: "button-click.png")
       // checkInButtion.image = UIImage(named: "button-click.png") //this should have worked
             //   mainImage.image = UIImage(named: "intro.image.jpg")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // navigationController?.navigationBar.barTintColor = .red
        
        
        let imageView  = UIImageView(frame: CGRect(x:0, y:0, width:80, height: 80))
        imageView.contentMode = .scaleAspectFill // set imageview's content mode
        
        //change back button color?
       // navigationController?.navigationBar.barTintColor = .purple
       // navigationController?.navigationBar.tintColor = .white
     //   [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
 
        
        let image = UIImage(named: "chapel")!
        imageView.image = image
        
        navigationItem.titleView = imageView

     
        //round button off when loading view
        //checkInButtion.layer.cornerRadius = 5.0

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //handle if user successfully checked in
    private func handleCheckInSuccess(){
        let alert = UIAlertController(title: "Check In Success!", message: "You have successfully checked in!", preferredStyle : .alert)
        present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "OK", style :.default, handler: nil))
        
    }
    
    
   //handle if user did NOT check in
    private func handleCheckInFailure(){
        let alert = UIAlertController(title: "Check In Failure!", message: "There was an issue checking in!", preferredStyle : .alert)
        present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "OK", style :.default, handler: nil))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
