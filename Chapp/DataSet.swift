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
        Prayer( title: "Prayer Request", description: "Please pray for Paul Methvin, grandfather of Sunni Hooper.  He will have surgery this morning.", timeStamp: makeDate(year: 2017, month: 3, day: 19)!),
        Prayer( title: "Prayers",  description: "Please pray for Hunter Jackson and his family since the death of his grandfather this past week.", timeStamp: makeDate(year: 2017, month: 3, day: 19)!),
            Prayer( title: "Maples Family", description: "Jessica and Dustin Kettlewell’s grandmother, Betty Yoho passed away.  Please keep the Kettelwell and Yoho families in prayer.", timeStamp: makeDate(year: 2017, month: 3, day: 20)!),
            Prayer( title: "Gomex Family", description: "Aunt of Felicia Gomez passed away.", timeStamp: makeDate(year: 2017, month: 4, day: 1)!),
            Prayer( title: "Roberts Family", description: "Nathan Roberts Great Grandmother passed away early this morning.", timeStamp: makeDate(year: 2017, month: 5, day: 2)!),
            Prayer( title: "Selbe Family", description: "Ben and Emily Selbe - Ben's grandfather, Ben Hancock passed away", timeStamp: makeDate(year: 2017, month: 6, day: 3)!),
            Prayer( title: "Johnson Family", description: "Steve Johnson is in the hospital in London (FHU Study Abroad program leader)", timeStamp: makeDate(year: 2017, month: 7, day: 4)!),
            Prayer( title: "Hurricane", description: "Please pray for Louisiana and Texas during the coming days with the aftermath of Hurricane Harvey.", timeStamp: makeDate(year: 2017, month: 8, day: 2017)!),
            Prayer( title: "McDoalnd Recovery", description: "Gayle McDonald is recovering from surgery.", timeStamp: makeDate(year: 2017, month: 9, day: 5)!),
            Prayer( title: "Prayers Needed", description: "Burnette Chapel church of Christ", timeStamp: makeDate(year: 2017, month: 10, day: 6)!),
            Prayer( title: "Kinningham Family", description: "Alan Kinningham’s father passed away", timeStamp: makeDate(year: 2017, month: 11, day: 8)!),
    ];
    
    //Announcements
    //title, descript, timeStamp, imagName
    static let announcementData = [
        Announcement(title: "China Now", description: "Need volunteers for China Now. Contact David Powell. ", timeStamp: makeDate(year: 2017, month: 3, day: 14)!, imageName: "hand.jpeg"),
        Announcement(title: "Graduation", description: "Seniors Need to turn in their graduation letter before Febuary 1. Contact Jared Gott for more details. ", timeStamp: makeDate(year: 2017, month: 4, day: 15)!, imageName: "graduation.jpeg"),
        Announcement(title: "Study Abroad", description: "Applications are due by March 15. Contact Cliff Thompson for details. ", timeStamp: makeDate(year: 2017, month: 5, day: 16)!, imageName: "travel.jpeg"),
        Announcement(title: "Starbucks", description: "Starbucks is hiring. Contact Richard England for an application. ", timeStamp: makeDate(year: 2017, month: 6, day: 17)!, imageName: "coffee.jpeg"),
        Announcement(title: "Photography", description: "The photography department is looking for models for a shoot. Contact Jud Davis for more information. ", timeStamp: makeDate(year: 2017, month: 8, day: 18)!, imageName: "camera.jpeg"),
        Announcement(title: "Mission Trip", description: "Looking for volunteers for a mission trip to Haiti. Contact Billy Smith for details. ", timeStamp: makeDate(year: 2017, month: 6, day: 17)!, imageName:"sunset.jpeg"),
        Announcement(title: "Makin Music", description: "Making Music Apllications are due by January 28. Please give to Tony Allen. ", timeStamp: makeDate(year: 2017, month: 6, day: 17)!, imageName: "balloons.jpg")
    ];
    
    /*
    static let announcementData = [
        Announcement(title: "China Now", description: "Bob", timeStamp: makeDate(year: 2017, month: 3, day: 14)!, imageName: "hand.jpeg"),
        Announcement(title: "Graduation", description: "Bob2 ", timeStamp: makeDate(year: 2017, month: 4, day: 15)!, imageName: "graduation.jpeg"),
        Announcement(title: "Study Abroad", description: "Bob3", timeStamp: makeDate(year: 2017, month: 5, day: 16)!, imageName: "travel.jpeg"),
        Announcement(title: "Starbucks", description: "Bob4", timeStamp: makeDate(year: 2017, month: 6, day: 17)!, imageName: "coffee.jpeg"),
        Announcement(title: "Photography", description: "Bob5 ", timeStamp: makeDate(year: 2017, month: 8, day: 18)!, imageName: "camera.jpeg"),
        Announcement(title: "Mission Trip", description: "Bob6 ", timeStamp: makeDate(year: 2017, month: 6, day: 17)!, imageName:"sunset.jpeg"),
        Announcement(title: "Makin Music", description: "Bob7 ", timeStamp: makeDate(year: 2017, month: 6, day: 17)!, imageName: "balloons.jpg")
    ];*/
    
    //Particpants
    //Name, Job,
    static let particpantData = [
        Participant(name: "Andrew Hinson", job: "Prayer"),
        Participant(name: "Logan Cain", job: "Songs"),
        Participant(name: "Ben Moon", job: "Scripture"),
        Participant(name: "Billy Smith", job: "Speaker")
        
    ]
    
    
}







































