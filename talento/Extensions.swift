//
//  Extensions.swift
//  talento
//
//  Created by Gökay Inan on 27.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import Foundation

extension Date
{
    
    func toMillis() -> Int64! {
          return Int64(self.timeIntervalSince1970 * 1000)
      }
    
  
   init(ticks: UInt64) {
        self.init(timeIntervalSince1970: Double(ticks)/10_000_000 - 62_135_596_800)
    }
    
    
    func isBetween(_ date1: Date, _ date2: Date) -> Bool
    {
        let createdTime = date1
        let currentTime = self
        let durationTime = date2
        
        let range = createdTime...durationTime
        
        if range.contains(currentTime) {
            return true
        } else {
            return false
        }
    }
    
    func timeLeftTo(_ date: Date) -> String
    {
        let calendar = Calendar.current
        
        let date1 = self
        let date2 = date
        
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date1, to: date2)
        
        let years = components.year!
        let months = components.month!
        let days = components.day!
        let hours = components.hour!
        let minutes = components.minute!
        let seconds = components.second!
        
        if years > 0 {
            return years == 1 ? "1 year left" : "\(years) years left"
        } else if months > 0 {
            return months == 1 ? "1 month left" : "\(months) months left"
        } else if days >= 7 {
            let weeks = days / 7
            return weeks == 1 ? "1 week left" : "\(weeks) weeks left"
        } else if days > 0 {
            return days == 1 ? "1 day left" : "\(days) days left"
        } else if hours > 0 {
            return hours == 1 ? "1 hour left" : "\(hours) hours left"
        } else if minutes > 0 {
            return minutes == 1 ? "1 minute left" : "\(minutes) minutes left"
        } else {
            return seconds == 1 ? "1 second left" : "\(seconds) seconds left"
        }
    }
    
    func calenderTimeSinceNow() -> String
    {
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self, to: Date())
        
        let years = components.year!
        let months = components.month!
        let days = components.day!
        let hours = components.hour!
        let minutes = components.minute!
        let seconds = components.second!
        
        if years > 0 {
            return years == 1 ? "1 year ago" : "\(years) years ago"
        } else if months > 0 {
            return months == 1 ? "1 month ago" : "\(months) months ago"
        } else if days >= 7 {
            let weeks = days / 7
            return weeks == 1 ? "1 week ago" : "\(weeks) weeks ago"
        } else if days > 0 {
            return days == 1 ? "1 day ago" : "\(days) days ago"
        } else if hours > 0 {
            return hours == 1 ? "1 hour ago" : "\(hours) hours ago"
        } else if minutes > 0 {
            return minutes == 1 ? "1 minute ago" : "\(minutes) minutes ago"
        } else {
            return seconds == 1 ? "1 second ago" : "\(seconds) seconds ago"
        }
    }
    
}
