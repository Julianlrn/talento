
//

import SwiftUI
import Firebase
import FirebaseUI

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
                image: i.document.get("image") as! String,
                participants: 13241,
                fbId: i.document.documentID,
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
