
//

import SwiftUI
import Firebase
import FirebaseUI


var uids: [String] = []
let db = Firestore.firestore()

class ChallengeData: ObservableObject{
    
    @Published var challengeData: [Challenge] = []
       
       init() {
           getChallengeData()
       }
    
    func getChallengeData() {
       
        db.collection("challenges").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    /*let data: Challenge =
                        Challenge(
                           // id: document.documentID,
                           image: document.get("image") as! String,
                           // image: "mountain",
                           participants: [],
                           fbId: document.documentID,
                           title: document.get("title") as! String,
                           isPublic: document.get("isPublic") as? Bool,
                           timestamp: document.get("timestamp") as! Timestamp,
                           duration: document.get("duration") as? Double ?? 1,
                           instructions: document.get("instructions") as! String,
                           entry: [entry(id: "f69eZbgp2ALX4aSDSOXo", author: "michael0301", image: "placeholder", likes: 2, swipe: 0, degree: 0)]
                        )*/
                    
                    let data: Challenge =
                        Challenge(
                            id: document.documentID,
                            fbId: document.documentID,
                            image: document.get("image") as! String,
                            participants: document.get("participants") as! [User.ID],
                            title: document.get("title") as! String,
                            timestamp: document.get("timestamp") as! Double,
                            duration: document.get("duration") as? Double ?? 1,
                            instructions: document.get("instructions") as! String,
                            isPublic: document.get("isPublic") as? Bool,
                            author: document.get("author") as! String,
                            latitude: document.get("latitude") as! Double,
                            longitude: document.get("longitude") as! Double,
                            isEnded: document.get("isEnded") as! Bool)
                    
                    print("append")
                    print(data)
                    self.challengeData.append(data)
                }
            }
        }
    }
}
