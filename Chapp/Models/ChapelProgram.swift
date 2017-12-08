//
//  ChapelProgram.swift
//  Chapp
//
//  Created by Robert Thompson on 12/2/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import Foundation




public class ChapelProgram{
    
    var title: String?
    var date : Date?
    var participants : [Participant]?
    
    init(title: String, date: Date, participants: [Participant]) {
        
        self.title = title
        self.date = date
        self.participants = participants
        
    }
    
    func getChapelProgramDateDay() -> Int{
        
        let now = date
        let calendar = Calendar.current
        
        let chapelDay = calendar.component( .day, from: now!)
        
        return chapelDay
    }
    
    func getChapelProgramDateMonth() -> Int{
        
        let now = date
        let calendar = Calendar.current
        
        let chapelDay = calendar.component( .month, from: now!)
        
        return chapelDay
    }
          
}


























