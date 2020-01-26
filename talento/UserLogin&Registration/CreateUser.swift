//
//  CreateUser.swift
//  talento
//
//  Created by Hedi Ajimi on 26.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseUI
import FirebaseFirestore
import FirebaseStorage

func CreateUser(name: String, bio: String, imagedata : Data, completion: @escaping(Bool)-> Void) {
    
    let db = Firestore.firestore()
    
    let storage = Storage.storage().reference()
    
    let uid = Auth.auth().currentUser?.uid
    
    //delete only for testing purposes
    //print("this user's uid: " + uid!)
    
    storage.child("profilepics").child(uid!).putData(imagedata, metadata: nil) { (_, err) in
        
        if err != nil {
            
            print((err?.localizedDescription)!)
            return
        }
        
        storage.child("profilepics").child(uid!).downloadURL { (url,err) in
            
            if err != nil {
                
                print((err?.localizedDescription)!)
                return
            }
            
            db.collection("users").document(uid!).setData(
            ["name": name,"bio": bio,"pic":"\(url!)","uid": uid!]) { (err) in
                
                if err != nil {
                    
                    print((err?.localizedDescription)!)
                    return
                }
                
                completion(true)
                
                UserDefaults.standard.set(true, forKey: "status")
                
                UserDefaults.standard.set(name, forKey: "UserName")

                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            }
        }
    }
}
