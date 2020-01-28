
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
                    let data: Challenge =
                        Challenge(
                           // id: document.documentID,
                           image: document.get("image") as! String,
                           // image: "mountain",
                           participants: 13241,
                           fbId: document.documentID,
                           title: document.get("title") as! String,
                           isPublic: document.get("isPublic") as? Bool,
                           timestamp: document.get("timestamp") as! Timestamp,
                           duration: document.get("duration") as? Double ?? 1,
                           instructions: document.get("instructions") as! String
                        )
                    
                    print("append")
                    print(data)
                    self.challengeData.append(data)
                }
            }
        }
        
    }
}
