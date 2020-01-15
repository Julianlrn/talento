//
//  ChallengeData.swift
//  talento
//
//  Created by Gökay Inan on 03.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseUI

/*
class getChallengeData : ObservableObject{
    @Published var challengesData: [Challenge] = []
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("challenges").addSnapshotListener{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges{
                let data: Challenge =
                Challenge(
                image: i.document.get("image") as! String,
                participants: i.document.get("participants") as! Int,
                title: i.document.get("title") as! String,
                visibility: i.document.get("visibility") as! String,
                time: i.document.get("time") as! Int,
                instructions: i.document.get("instructions") as! String)
                
                self.challengesData.append(data)
            }
        }
    }
}

*/


var challengesData: [Challenge] = []
var uids: [String] = []
let db = Firestore.firestore()

func getChallengeData() -> [Challenge]{

    
    
        db.collection("challenges").addSnapshotListener{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges{
                if (uids.contains(i.document.documentID)){
                    return}
                let data: Challenge =
             Challenge(
                fbId: i.document.documentID,
                /* image: i.document.get("image") as! String,
                 participants: i.document.get("participants") as! Int,
                 title: i.document.get("title") as! String,
                 visibility: i.document.get("visibility") as! String,
                 time: i.document.get("time") as! Int,
                 instructions: i.document.get("instructions") as! String*/
                image: i.document.get("image") as! String,
                participants: 13241,
                title: i.document.get("title") as! String,
                visibility: "afesgsg",
                time: 1243,
                instructions: i.document.get("instructions") as! String
             )
                print("append")
                print(data)
                challengesData.append(data)
                uids.append(i.document.documentID)
            }

}
    print("Test");
    //print(document.get("image") as! String)
    print(challengesData);
    return challengesData
    
}

/*
    Challenge(
        image: "mountain",
        participants: 5438,
        title: "Most beautiful mountain!",
        visibility: "Public",
        time: 28800,
        instructions: [
            "1. Rule – Lorem ipsum dolor sit amet, consetetur sadipscing elitr",
            "2. Rule – At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est",
            "3. Rule – Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor"
        ]
    ),
    Challenge(
        image: "skateboard",
        participants: 18,
        title: "Can you flip?",
        visibility: "Public",
        time: 28800,
        instructions: [
            "1. Rule – Lorem ipsum dolor sit amet, consetetur sadipscing elitr",
            "2. Rule – At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est",
            "3. Rule – Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor"
        ]
    ),
    Challenge(
        image: "sushi",
        participants: 877,
        title: "Excellent sushi.",
        visibility: "Public",
        time: 28800,
        instructions: [
            "1. Rule – Lorem ipsum dolor sit amet, consetetur sadipscing elitr",
            "2. Rule – At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est",
            "3. Rule – Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor"
        ]
    )
]*/
