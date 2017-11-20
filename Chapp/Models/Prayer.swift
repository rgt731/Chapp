//
//  Prayer.swift
//  Chapp
//
//  Created by Robert Thompson on 11/7/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import Foundation



public class Prayer {

    var title: String?
    var description: String?
    var timeStamp: Date?

    
   /*  init() {
      timeStamp = Date()
     
     }*/
    
    init(  title: String, description: String, timeStamp: Date) {
        
      //  self.name = name
        self.title = title
        self.description = description
        self.timeStamp = timeStamp

    }
    
   convenience init(name: String, description: String, timeStamp: Date ) {
        self.init(name:name, description:description,timeStamp:timeStamp)

    }
    
}




