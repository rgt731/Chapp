//
//  News.swift
//  Chapp
//
//  Created by Robert Thompson on 11/7/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import Foundation



public class News {
    
    var timeStamp: String?
    // var timeStamp: Date?
    var description: String?
    
    /*  init() {
     timeStamp = Date()
     
     }*/
    
    init( description: String, timeStamp: String) {
        
        //  self.name = name
        self.description = description
        self.timeStamp = timeStamp
  }


}
