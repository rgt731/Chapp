//
//  DataSet.swift
//  Chapp
//
//  Created by Robert Thompson on 11/7/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import Foundation


class DataSet {
    
    
    static func makeDate(year:Int, month: Int, day:Int) -> Date? {
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        let userCalendar = Calendar.current
        if let date = userCalendar.date(from: dateComponents) {
            return date

        }
        return nil 
    }
    
    static let prayerData = [
        Prayer( description: "I need encouragement", timeStamp: makeDate(year: 3, month: 19, day: 2017)!),
        Prayer( description: "I need love", timeStamp: makeDate(year: 3, month: 20, day: 2017)!)
    ];
    
    static let newsData = [
        Prayer( description: "Need help with hurricane releief", timeStamp: makeDate(year: 1, month: 15, day: 2016)!),
        Prayer( description: "Looking for making music Applications", timeStamp: makeDate(year: 2, month: 22, day: 2016)!)
    ];
    
    
}







































