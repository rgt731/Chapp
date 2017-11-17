//
//  PrayerViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/17/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class PrayerViewController: UIViewController {
    
    var prayer: Prayer?
    
    @IBOutlet weak var prayerTitle: UILabel!
    @IBOutlet weak var prayerDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       prayerTitle.text = prayer?.title
       prayerDescription.text = prayer?.description
        //no need for images here
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}







