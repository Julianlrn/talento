//
//  ForeignProfileView.swift
//  talento
//
//  Created by Julian Lorenz on 12.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//



import Foundation
import SwiftUI
import FBSDKLoginKit
import Firebase
import FirebaseUI

struct ForeignProfileView: View {

    var profileUser: User
    
    @ObservedObject var userList = UserList()
   
    @ObservedObject var challenges = ChallengeData()
   
    
    @State var tabIndex = 0
    @State var imageIndex = 0
   
    let db = Firestore.firestore()
    
    var body: some View {
        if var currentUser = userList.getCurrentUser(), challenges.challengeData.count != 0{
                   return AnyView(
                    NavigationView {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            ProfilePictureView(currentUser: profileUser)
                                .frame(width:UIScreen.main.bounds.width, height: 300)
                                .clipped()
                                .colorMultiply(Color.init(red:0.96, green:0.11, blue:0.34, opacity: 1))
                                .overlay (
                                    VStack(alignment: HorizontalAlignment.leading, spacing: 96){
                                        VStack(alignment: .trailing){
                                            HStack {
                                                Spacer()
                                                Button(action: {
                                                    print("SHARE ÖFFNEN")
                                                }) {
                                                    Image(systemName: "square.and.arrow.up")
                                                    .foregroundColor(.white)
                                                    .frame(width: 20, height: 25)
                                                }
                                              /*  Image(systemName: "square.and.arrow.up")
                                                    .resizable()
                                                    .frame(width: 19, height: 24)
                                                    .foregroundColor(Color.white)*/
                                            }
                                           // .onTapGesture {
                                             //   print("SHARE ÖFFNEN")
                                           // }
                                        }//.padding(.top, 64)
                                        //.padding(.horizontal, 16)

                                        VStack(alignment: .leading, spacing: 8) {
                                            HStack {
                                                Text("\(profileUser.name)")
                                                    .font(Font.system(size: 32, weight: .bold))
                                                    .foregroundColor(Color.white)
                                            }
                                            HStack {
                                                Text("\(profileUser.bio)")
                                                    .font(Font.system(size: 24, weight: .light))
                                                    .foregroundColor(Color.white)
                                            }
                                            .padding(.bottom, 24)
                                            //View for TalentPoints, Followers and Preferences Button
                                            HStack (spacing : 80){
                                                HStack(spacing: 40) {
                                                    VStack(spacing: 4){
                                                        Text("\(Int(profileUser.talentPoints))")
                                                            .font(Font.system(size: 20, weight: .bold))
                                                            .foregroundColor(Color.black)
                                                        Text("TALENT POINTS")
                                                            .font(Font.system(size: 8))
                                                            .foregroundColor(Color.black)
                                                    }.frame(minWidth: 76)

                                                    VStack(spacing: 4){
                                                        Text("\(profileUser.followers.count)")
                                                            .font(Font.system(size: 20, weight: .bold))
                                                            .foregroundColor(Color.black)
                                                        Text("FOLLOWER")
                                                            .font(Font.system(size: 8))
                                                            .foregroundColor(Color.black)
                                                    }.frame(minWidth: 56)
                                                }

                                                HStack {
                                                    if currentUser.followed.contains(profileUser.id){
                                                        Image(self.imageIndex == 0 ? "UnfollowButton" : "FollowButton")
                                                        .resizable()
                                                        .frame(width: 90, height: 86)
                                                        .onTapGesture {
                                                            if self.imageIndex == 0 {
                                                                self.imageIndex = 1
                                                                if let index = currentUser.followed.firstIndex(of: self.profileUser.id) {
                                                                    currentUser.followed.remove(at: index)
                                                                }
                                                                
                                                                self.db.collection("users").document(currentUser.id).updateData(["followed" : currentUser.followed]);
                                                                
                                                                var profileUser1 : User = self.profileUser
                                                                    profileUser1.followed.insert(currentUser.id, at: 0);
                                                                if let index = profileUser1.followed.firstIndex(of: currentUser.id) {
                                                                    profileUser1.followed.remove(at: index)
                                                                }
                                                                self.db.collection("users").document(self.profileUser.id).updateData(["followers" : profileUser1.followed]);
                                                            }
                                                            else {
                                                                self.imageIndex = 0
                                                                currentUser.followed.insert(self.profileUser.id, at: 0);
                                                                self.db.collection("users").document(currentUser.id).updateData(["followed" : currentUser.followed]);
                                                                
                                                                    var profileUser1 : User = self.profileUser
                                                                    profileUser1.followed.insert(currentUser.id, at: 0);
                                                                self.db.collection("users").document(self.profileUser.id).updateData(["followers" : profileUser1.followed]);
                                                            }
                                                        }
                                                        
                                                        
                                                    }
                                                    else{
                                                    Image(self.imageIndex == 0 ? "FollowButton" : "UnfollowButton")
                                                        .resizable()
                                                        .frame(width: 90, height: 86)
                                                        .onTapGesture {
                                                            if self.imageIndex == 0 {
                                                                self.imageIndex = 1
                                                                currentUser.followed.insert(self.profileUser.id, at: 0);
                                                                self.db.collection("users").document(currentUser.id).updateData(["followed" : currentUser.followed]);
                                                                
                                                                    var profileUser1 : User = self.profileUser
                                                                    profileUser1.followed.insert(currentUser.id, at: 0);
                                                                self.db.collection("users").document(self.profileUser.id).updateData(["followers" : profileUser1.followed]);
                                                            }
                                                            else {
                                                                self.imageIndex = 0
                                                                
                                                            }
                                                        }
                                                    }
                                                }
                                                
                                              //Spacer()
                                             }
                                            //.padding(24)
                                            .padding(.leading, 24)
                                            .frame(minWidth: 343)
                                            .background(Color.white)
                                            .cornerRadius(16)
                                            .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24), radius: 24, x: 0, y: 12)

                                        }
                                       // .padding(.top, 198)
                                       // .padding(.horizontal, 16)

                                    }.padding(.horizontal, 16)
                                    .padding(.top, 72)

                                )

                            //Buttons to Switch between Achievements, Active Challenges and History Challenges
                            HStack(spacing: 16) {
                                HStack {
                                        Text("Achievements")
                                            .foregroundColor(self.tabIndex == 0 ? Color.init(red:1.00, green:1.00, blue:1.00) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.32))
                                        }
                                        .padding(16)
                                        .background(self.tabIndex == 0 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.06))
                                        .cornerRadius(16)
                                        .onTapGesture {
                                            self.tabIndex = 0
                                        }

                                HStack {
                                        Text("Active")
                                            .foregroundColor(self.tabIndex == 1 ? Color.init(red:1.00, green:1.00, blue:1.00) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.32))
                                        }
                                        .padding(16)
                                        .background(self.tabIndex == 1 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.06))
                                               .cornerRadius(16)
                                        .onTapGesture {
                                            self.tabIndex = 1
                                        }

                                HStack {
                                    Text("History")
                                            .foregroundColor(self.tabIndex == 2 ? Color.init(red:1.00, green:1.00, blue:1.00) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.32))
                                        }
                                        .padding(16)
                                        .background(self.tabIndex == 2 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.06))
                                        .cornerRadius(16)
                                        .onTapGesture {
                                            self.tabIndex = 2
                                        }
                            }
                            .padding(.top, 64)
                            .padding(.bottom, 16)
                            .padding(.leading, 16)

                            if self.tabIndex == 0 {
                                //Alle Challenges, an denen User Teilimmt  && "time == 0"  && "Ranking <= 3"
                                ScrollView(.vertical, showsIndicators: false) {
                                    ForEach(challenges.challengeData) { item in
                                        UserFeedView()
                                        NavigationLink(destination: ChallengeDetailView(imageLoader: ImageLoader(urlString: item.image), challenge: item)) {
                                           ChallengeCardView(challenge: item, imageLoader: ImageLoader(urlString: item.image))
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                    .padding(.horizontal, 16)
                                }
                            }
                            else if self.tabIndex == 1 {
                                //Alle Challenges, bei denen der User (ID) teilnimmt && "time != 0"
                                ScrollView(.vertical, showsIndicators: false) {
                                    ForEach(challenges.challengeData) { item in
                                        UserFeedView()
                                        NavigationLink(destination: ChallengeDetailView(imageLoader: ImageLoader(urlString: item.image), challenge: item)) {
                                           ChallengeCardView(challenge: item, imageLoader: ImageLoader(urlString: item.image))
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                    .padding(.horizontal, 16)
                                }
                            }
                            else if self.tabIndex == 2 {
                                //Alle Challenges, bei denen der User (ID) teilnimmt
                               ScrollView(.vertical, showsIndicators: false) {
                                    ForEach(challenges.challengeData) { item in
                                        UserFeedView()
                                        NavigationLink(destination: ChallengeDetailView(imageLoader: ImageLoader(urlString: item.image), challenge: item)) {
                                           ChallengeCardView(challenge: item, imageLoader: ImageLoader(urlString: item.image))
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                    .padding(.horizontal, 16)
                                }
                            }

                        }
                    }.edgesIgnoringSafeArea(.all)})
        }
        else {
            return AnyView(
                VStack{
                    Text("Loading")
                    Spacer()
                }.padding(.top, 120)
            )
        }
         
        
    }
    
    
}









