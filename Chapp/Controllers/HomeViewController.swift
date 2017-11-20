//
//  HomeViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/17/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet weak var checkInButtion: UIButton!
    
    
    @IBAction func homeButtonClicked(_ sender: UIButton) {
        
      //  checkInButtion.currentImage = UIImage(named: "intro.image.jpg")
             //   mainImage.image = UIImage(named: "intro.image.jpg")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // navigationController?.navigationBar.barTintColor = .red
        
        
        let imageView  = UIImageView(frame: CGRect(x:0, y:0, width:80, height: 80))
        imageView.contentMode = .scaleAspectFill // set imageview's content mode
        
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
