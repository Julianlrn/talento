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
    @Published var entries = [Entry]()
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
                print("in der for schleife" + " asdf " + idFromChallenge + " challenge fbid " + challenge.fbId)
                if (idFromChallenge == challenge.fbId){
                    print("im if" + idFromChallenge + "fbid " + challenge.fbId)
                    self.entries.append(Entry(id: id,idFromChallenge: idFromChallenge, author: author, image: image, likes: 0, swipe: 0, degree: 0))
                    print(self.entries)
                }
                
                self.entries.append(Entry(id: id, idFromChallenge: idFromChallenge, author: author, image: image, likes: likes, swipe: 0, degree: 0))
            }
                
        }
    }
    
    func update(id : Entry, value : CGFloat, degree : Double) {
        for i in 0..<self.entries.count {
            
            if self.entries[i].id == id.id {
                self.entries[i].swipe = value
                self.entries[i].degree = degree
            }
            
        }
    }
}



struct Entry: Identifiable {
    var id: String
    var idFromChallenge: String
    var author: String
    var image: String
    var likes: Double
    var swipe: CGFloat
    var degree : Double
}
