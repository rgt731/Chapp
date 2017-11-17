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
    
    //Prayers
    //title, description, timestamp
    static let prayerData = [
        Prayer( title: "Title 1", description: "I need help", timeStamp: makeDate(year: 2017, month: 3, day: 19)!),
        Prayer( title: "Title 2",  description: "I need love", timeStamp: makeDate(year: 2017, month: 3, day: 19)!),
        Prayer( title: "Title 3", description: "I need faith", timeStamp: makeDate(year: 2017, month: 3, day: 20)!),
        Prayer( title: "Title 4", description: "I need hope", timeStamp: makeDate(year: 2017, month: 4, day: 1)!),
        Prayer( title: "Title 5", description: "I need love", timeStamp: makeDate(year: 2017, month: 5, day: 2)!),
        Prayer( title: "Title 6", description: "I need guideance", timeStamp: makeDate(year: 2017, month: 6, day: 3)!),
        Prayer( title: "Title 7", description: "I need understanding", timeStamp: makeDate(year: 2017, month: 7, day: 4)!),
        Prayer( title: "Title 8", description: "I need money", timeStamp: makeDate(year: 2017, month: 8, day: 2017)!),
        Prayer( title: "Title 9", description: "I need direction", timeStamp: makeDate(year: 2017, month: 9, day: 5)!),
        Prayer( title: "Title 10", description: "I need a better gpa", timeStamp: makeDate(year: 2017, month: 10, day: 6)!),
        Prayer( title: "Title 11", description: "I need Jesus", timeStamp: makeDate(year: 2017, month: 11, day: 8)!),
    ];
    
    //Announcements
    //title, descript, timeStamp, imagName
    static let announcementData = [
        Announcement(title: "NewsTitle 1", description: "Need help with hurricane releief", timeStamp: makeDate(year: 2017, month: 3, day: 14)!, imageName: "balloons.jpg"),
         Announcement(title: "NewsTitle 2", description: "Need help with distaster releief", timeStamp: makeDate(year: 2017, month: 4, day: 15)!, imageName: "balloons.jpg"),
          Announcement(title: "NewsTitle 3", description: "Need help tutoring?", timeStamp: makeDate(year: 2017, month: 5, day: 16)!, imageName: "balloons.jpg"),
           Announcement(title: "NewsTitle 4", description: "Need somputer science Majors", timeStamp: makeDate(year: 2017, month: 6, day: 17)!, imageName: "balloons.jpg"),
        Announcement(title: "NewsTitle 5", description: "Looking for making music Applications", timeStamp: makeDate(year: 2017, month: 8, day: 18)!, imageName: "balloons.jpg")
    ];
    
    //Particpants
    //Name, Job,
    static let particpantData = [
        Participant(name: "Andrew Hinson", job: "Prayer"),
        Participant(name: "Logan Cain", job: "Songs"),
        Participant(name: "Ben Moon", job: "Scripture"),
        Participant(name: "Billy Smith", job: "Speaker")
        
    ]
    
    
}







































