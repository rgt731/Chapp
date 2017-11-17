//
//  News.swift
//  Chapp
//
//  Created by Robert Thompson on 11/7/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import Foundation



public class Announcement {
    
    //var timeStamp: String?
    var timeStamp: Date?
    var description: String?
    var title: String?
    var imageName: String?
    var imageURL: String?
    
    /*  init() {
     timeStamp = Date()
     
     }*/
    
    //title, descript, timeStamp, imagName
    init( title: String, description: String, timeStamp: Date, imageName: String) {
        
        //  self.name = name
        self.description = description
        self.timeStamp = timeStamp
        self.title = title
        self.imageName = imageName
        
    }
    
    convenience init(title: String, description: String, timeStamp: Date, imageURL: String ) {
        self.init(title:title, description:description, timeStamp:timeStamp, imageURL:imageURL)
        
        self.imageURL = imageURL
    }

 
}
