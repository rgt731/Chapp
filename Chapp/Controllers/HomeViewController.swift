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

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
