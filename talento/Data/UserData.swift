//
//  UserData.swift
//  talento
//
//  Created by Julian Lorenz on 26.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//
/*
import Foundation
import SwiftUI
import Firebase
import FirebaseUI
import FirebaseFirestore

var userData: [User] = []
var uidsForUser: [String] = []

var ref: DatabaseReference!



func getUserData() {
   
    db.collection("users").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
                let data: User =
                User(id: document.get("uid")as! UUID,
                     name: document.get("name")as! String,
                     image: document.get("image")as! String,
                     bio: document.get("bio")as! String,
                     challenges: document.get("challenges")as! [Challenge],
                     followers: document.get("followers")as! [User],
                     followed: document.get("followed")as! [User],
                     latitude: document.get("latitude")as! Double,
                     longitute: document.get("longitude")as! Double,
                     talentPoints: document.get("talentPoints")as! Double)
                
                print("append")
                print(data)
                userData.append(data)
            }
        }
    }
    
}

func getCurrentUser() -> User{
    
    getUserData()
    let currentUserID = Auth.auth().currentUser?.uid
   // let users : [User] = getUserData()
    var currentUser: User?

     
    for User in userData{
        print("1")
        if (User.id.uuidString == currentUserID){
            currentUser = User
            
        }
    }
    return currentUser!
}






*/
