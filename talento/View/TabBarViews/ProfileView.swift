//
//  ProfileView.swift
//  talento
//
//  Created by Julian Lorenz on 12.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase

struct ProfileView: View {

    @ObservedObject var userList = UserList()
    @ObservedObject var challenges = ChallengeData()
   // @ObservedObject var obser: observer
    @ObservedObject var entries = SortedEntriesData()
    @State var tabIndex = 0
   

    var body: some View {
        if let currentUser = userList.getCurrentUser(), challenges.challengeData.count != 0{
                   return AnyView(
                    NavigationView {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: HorizontalAlignment.leading) {
                            ProfilePictureView(currentUser: currentUser)
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
                                                Text("\(currentUser.name)")
                                                    .font(Font.system(size: 32, weight: .bold))
                                                    .foregroundColor(Color.white)
                                            }
                                            HStack {
                                                Text("\(currentUser.bio)")
                                                    .font(Font.system(size: 24, weight: .light))
                                                    .foregroundColor(Color.white)
                                            }
                                            .padding(.bottom, 24)
                                            //View for TalentPoints, Followers and Preferences Button
                                            HStack (spacing : 80){
                                                HStack(spacing: 40) {
                                                    VStack(spacing: 4){
                                                        Text("\(Int(currentUser.talentPoints))")
                                                            .font(Font.system(size: 20, weight: .bold))
                                                            .foregroundColor(Color.black)
                                                        Text("TALENT POINTS")
                                                            .font(Font.system(size: CGFloat(8)))
                                                            .foregroundColor(Color.black)
                                                    }.frame(minWidth: 76)

                                                    VStack(spacing: 4){
                                                        Text("\(currentUser.followers.count)")
                                                            .font(Font.system(size: 20, weight: .bold))
                                                            .foregroundColor(Color.black)
                                                        Text("FOLLOWER")
                                                            .font(Font.system(size: 8))
                                                            .foregroundColor(Color.black)
                                                    }.frame(minWidth: CGFloat(56))
                                                }

                                                HStack {
                                                    Image(systemName: "person.2.fill")
                                                        .resizable()
                                                        .frame(width: 36, height: CGFloat(24))
                                                        .foregroundColor( Color.init(red:0.00, green:0.00, blue:0.00, opacity: 1.00))
                                                }
                                                .onTapGesture {
                                                    print("FREUNDESLISTE ÖFFNEN")
                                                }
                                              //Spacer()
                                             }
                                            .padding(24)
                                            //.padding(.leading, 24)
                                            .frame(minWidth: 343)
                                            .background(Color.white)
                                            .cornerRadius(16)
                                            .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24), radius: 24, x: 0, y: 12)

                                        }
                                       // .padding(.top, 198)
                                       // .padding(.horizontal, 16)

                                    }.padding(.horizontal, CGFloat(16))
                                    .padding(.top, CGFloat(72))

                                )

                            //Buttons to Switch between Achievements, Active Challenges and History Challenges
                           /* HStack(spacing: 16) {
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
                            .padding(.leading, 16)*/

                           /* if self.tabIndex == 0 {
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
                            }*/
                        VStack{
                            //Text("\(self.entries.sortedEntriesData.count)")
                            ScrollView(.vertical, showsIndicators: false) {
                                ForEach(challenges.challengeData) { item in
                                    ForEach(self.entries.sortedEntriesData) { entry in
                                        if entry.author == currentUser.id{
                                            if entry.idFromChallenge == item.id {
                                     
                                                NavigationLink(destination: ChallengeDetailView(imageLoader: ImageLoader(urlString: item.image), challenge: item)) {
                                                    ChallengeCardView(challenge: item, imageLoader: ImageLoader(urlString: item.image))
                                                }
                                                .buttonStyle(PlainButtonStyle())
                                            }
                                
                                        }
                                    }
                                }
                                .padding(.horizontal, 16)
                            }
                        }.padding(.top, CGFloat(64))

                        }
                    }.edgesIgnoringSafeArea(.all)})
        }
        else{
            return AnyView(VStack(alignment: .leading){Spacer();Text("Loading").font(.title);Spacer()}.frame(width: UIScreen.main.bounds.width))
        }
         
        
    }
}
