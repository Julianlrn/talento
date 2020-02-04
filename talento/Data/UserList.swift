//
//  UserList.swift
//  talento
//
//  Created by Julian Lorenz on 27.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import MapKit



class UserList:NSObject, ObservableObject {
   
    @Published var userData: [User] = []
    
    let locationManager : CLLocationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.getUserData()
    }
    
    func getUserData() {
       
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    //print("\(document.documentID) => \(document.data())")
                    let data: User =
                        User(id: document.get("uid")as! String,
                         name: document.get("name")as! String,
                         image: document.get("image")as! String,
                         bio: document.get("bio")as! String,
                         challenges: document.get("challenges")as! [Challenge.ID],
                         followers: document.get("followers")as! [User.ID],
                         followed: document.get("followed")as! [User.ID],
                         latitude: document.get("latitude")as! Double,
                         longitude: document.get("longitude")as! Double,
                         talentPoints: document.get("talentPoints")as! Double)
                    
                    //print("append")
                    //print(data)
                    self.userData.append(data)
                }
            }
        }
        
    }
    
    public func getUserwithId(id: String) -> String{
        
        let filteredUser = userData.filter { $0.id.contains(id) }
        
        if filteredUser.isEmpty{
        
          return "Example User"
        } else {
            return filteredUser[0].name
          
        }
    }
    
    public func getUserUserwithId(id: String) -> User{
        
        let filteredUser = userData.filter { $0.id.contains(id) }
        
       
        return filteredUser[0]
          
        
    }
    
    
    
    func getCurrentUser() -> User?{
        let currentUserID = Auth.auth().currentUser?.uid
        var currentUser: User?

         
        for User in userData{
            
            if (User.id == currentUserID){
                currentUser = User
                currentUser!.latitude = loadCurrentLocation().latitude
                currentUser!.longitude = loadCurrentLocation().longitude
                //print("\(currentUser!.latitude)")
            }
        }
        return currentUser
    }
    
    
   
    func loadCurrentLocation() -> (latitude: Double, longitude:Double){
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.delegate = self
        locationManager.requestLocation()

        return ((locationManager.location?.coordinate.latitude)!,(locationManager.location?.coordinate.longitude)!)
    }
        
}

extension UserList : CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("error:: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            //print("location:: (location)")
        }

    }

}























































