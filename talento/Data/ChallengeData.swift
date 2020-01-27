
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
                           timestamp: 60000,
                           instructions: document.get("instructions") as! String,
                           entry: [entry(id: "f69eZbgp2ALX4aSDSOXo", author: "michael0301", image: "sushi", likes: 2, swipe: 0, degree: 0)]
                        )
                    
                    print("append")
                    print(data)
                    self.challengeData.append(data)
                }
            }
        }
        
    }


/*func getChallengeData(){


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
                    // id: i.document.documentID,
                    image: i.document.get("image") as! String,
                    // image: "mountain",
                    participants: 13241,
                    fbId: i.document.documentID,
                    title: i.document.get("title") as! String,
                    isPublic: i.document.get("isPublic") as? Bool,
                    timestamp: 60000,
                    instructions: i.document.get("instructions") as! String,
                    entry: [entry(id: "f69eZbgp2ALX4aSDSOXo", author: "michael0301", image: "sushi", likes: 2, swipe: 0, degree: 0)]
                )
                print("append")
                print(data)
                self.challengeData.append(data)
                uids.append(i.document.documentID)
                print(self.challengeData);
            }

}
    print("Test");
    //print(document.get("image") as! String)
    //print(challengeData);
   // print(self.challengeData);
  
}

*/

}
