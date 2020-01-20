
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
                // id: i.document.documentID,
                // image: i.document.get("image") as! String,
                image: "mountain",
                participants: 13241,
                fbId: i.document.documentID,
                title: i.document.get("title") as! String,
                visibility: "Public",
                time: 60000,
                instructions: i.document.get("instructions") as! String,
                entry: [entry(id: "f69eZbgp2ALX4aSDSOXo", author: "michael0301", image: "sushi", likes: 2, swipe: 0, degree: 0)]
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
@ -45,4 +124,4 @@ let challengesData: [Challenge] = [
            "3. Rule – Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor"
        ]
    )
]
]*/
