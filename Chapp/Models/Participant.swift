//
//  Participant.swift
//  Chapp
//
//  Created by Robert Thompson on 11/17/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import Foundation

public class Participant{
    
    
    var name: String?
    var job : String?
    var imageName: String?
    var imageURL: String?


    init(name: String, job: String, imageName: String) {
        
        self.name = name
        self.job = job
        self.imageName = imageName

    }
    
    convenience init(name: String, job: String, imageURL: String ) {
        self.init(name:name, job:job, imageURL:imageURL)
        
        self.imageURL = imageURL
    }



}
