//
//  ChallengeModel.swift
//  talento
//
//  Created by Gökay Inan on 03.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase

struct Challenge: Identifiable {
    var id : String
    var fbId: String
    var image: String
    var participants: [User.ID]
    var title: String
    var timestamp: Double
    var duration: Double
    var instructions: String
    var isPublic: Bool?
    var author: User.ID
    var latitude: Double
    var longitude: Double
    var isEnded: Bool
    
    func setChallengeEnded(challengeId: String){
        
        let challengeId = challengeId

        let db = Firestore.firestore()
        
        db.collection("challenges")
            .document(challengeId)
            .updateData(["isEnded": true]) { (err) in
                
                if err != nil{
                   
                    print((err?.localizedDescription)!)
                    return
        }}
    }
    
    func challengeEnded() -> Bool {
        
        let createdTime = Date(timeIntervalSince1970: self.timestamp / 1000)
        let currentTime = Date()
        let durationTime = createdTime.addingTimeInterval(self.duration * 60)
        
        if currentTime.isBetween(createdTime, durationTime) {
            return false
        } else {
            setChallengeEnded(challengeId: fbId)
            return true
        }
    }
    
    func getTimeLeft() -> String {
        
        //let createdTime = self.challenge.Date(tick: timestamp).dateValue()
        let createdTime = Date(timeIntervalSince1970: self.timestamp / 1000)
        let currentTime = Date()
        let durationTime = createdTime.addingTimeInterval(self.duration * 60)
        
        let range = createdTime...durationTime
        
        if range.contains(currentTime) {
            return currentTime.timeLeftTo(durationTime)
        } else {
            return "Ended"
        }
    }
    

}
