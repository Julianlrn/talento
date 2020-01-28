//
//  SortedChallengeEntriesData.swift
//  talento
//
//  Created by Hedi Ajimi on 28.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseUI

public class SortedEntriesData: ObservableObject{
    
    @Published var sortedEntriesData = [Entry]()
       
    init() {
        let db = Firestore.firestore()
        
        db.collection("challenge-entry").order(by: "likes", descending: true).getDocuments { (snap, err) in
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
                self.sortedEntriesData.append(Entry(id: id, idFromChallenge: idFromChallenge, author: author, image: image, likes: likes, swipe: 0, degree: 0))
                print(item)
            }
        }
    }
}
