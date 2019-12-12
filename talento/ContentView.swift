//
//  ContentView.swift
//  talento
//
//  Created by Julian Lorenz on 08.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import SwiftUI
import FBSDKLoginKit
import Firebase
import FirebaseUI


struct ContentView: View {
    
    @EnvironmentObject var loginStatus:LoginCheck
    
    var body: some View {
        
        /*if loginStatus.loading == true {
            return AnyView(Text("Loading"))
        }
        else if loginStatus.loggedIn == false {
            return AnyView(login().frame(width: 100, height: 50))
        }*/
            return AnyView(
                            TabView{
                                FeedView().tabItem {
                                        Image(systemName: "house")
                                        Text("Feed")
                                    }.tag(0)
                                ChallengeView().tabItem {
                                        Image(systemName: "bolt")
                                        Text("Challenges")
                                    }.tag(1)
                                ActivityView().tabItem {
                                        Image(systemName: "suit.heart")
                                        Text("Activity")
                                    }.tag(2)
                                ProfileView().tabItem {
                                        Image(systemName: "person")
                                        Text("Profile")
                                    }.tag(3)
                                }
                            )
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LoginCheck())
        
    }
}


    



