//
//  AnnouncementViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/16/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class AnnouncementViewController: UIViewController {

    var announcement: Announcement?
    
    @IBOutlet weak var announcementViewImage: UIImageView!
    @IBOutlet weak var announcementViewTitle: UILabel!
    @IBOutlet weak var announcementViewDescription: UILabel!
    
    //title, descript, timeStamp, imagName
    override func viewDidLoad() {
        super.viewDidLoad()
        
        announcementViewTitle.text = announcement?.title
        announcementViewDescription.text = announcement?.description
        
        
        
        //image things ***
        if let imageName = announcement?.imageName {
            announcementViewImage.image = UIImage(named: imageName)
            // Do any additional setup after loading the view.
        } else if let imageURL = announcement?.imageURL {
            let session = URLSession(configuration: .default)
            if let url = URL(string: imageURL) {
                let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                    if let d = data {
                        DispatchQueue.main.async {
                            self.announcementViewImage.image = UIImage(data: d)
                        }
                    } 
                })
                task.resume()
            }
        }
        
        
        
    }

 

}







