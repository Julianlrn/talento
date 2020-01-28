//
//  EntryModel.swift
//  talento
//
//  Created by Gökay Inan on 20.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase

public class observer: ObservableObject {

    @ObservedObject var userList = UserList()
    @Published var entries = [entry]()
    // let currentlyViewedChallenge = getCurrentlyViewedChallenge()
    let challenge: Challenge

    init(challenge: Challenge) {
        self.challenge = challenge
        let db = Firestore.firestore()
        db.collection("challenge-entry").getDocuments { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for item in snap!.documents {

                let id = item.documentID
                let author = item.get("author") as! String
                let image = item.get("image") as! String
                let likes = item.get("likes") as! Double
                let idFromChallenge = item.get("id") as! String
                
                if (idFromChallenge == challenge.fbId){
                    
                    self.entries.append(entry(id: id,idFromChallenge: idFromChallenge, author: author, image: image, likes: likes, swipe: 0, degree: 0, ratedUser: []))
                    
                }
            }
        }
    }

    func update(id : entry, value : CGFloat, degree : Double) {
        for i in 0..<self.entries.count {

            if self.entries[i].id == id.id {
                self.entries[i].swipe = value
                self.entries[i].degree = degree
            }

        }
    }

    func like(id:entry){
        for i in 0..<self.entries.count {

            if self.entries[i].id == id.id {
                likeEntry(entryId: self.entries[i].id)
            }
        }
    }

    func addUser(entryId: entry, userId: User){
        for i in 0..<self.entries.count {

            if self.entries[i].id == entryId.id {
                addRatedUser(entryId: self.entries[i].id, userId: userId)
            }
        }
    }

    func addRatedUser(entryId: String, userId: User){

        let entryId = entryId
        let userId = userId.id

        let db = Firestore.firestore()

        db.collection("challenge-entry")
            .document(entryId)
            .updateData([
                "ratedUser": FieldValue.arrayUnion([userId])
            ]) { (err) in

                if err != nil{

                    print((err?.localizedDescription)!)
                    return
        }}
    }

    func likeEntry(entryId: String){

        let entryId = entryId

        let db = Firestore.firestore()

        db.collection("challenge-entry")
            .document(entryId)
            .updateData(["likes": FieldValue.increment(Int64(1))]) { (err) in

                if err != nil{

                    print((err?.localizedDescription)!)
                    return
        }}
    }
}



struct entry: Identifiable {
    var id: String
    var idFromChallenge: String
    var author: String
    var image: String
    var likes: Double
    var swipe: CGFloat
    var degree : Double
    var ratedUser: [User.ID]
}
