//
//  ChallengesView.swift
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


struct ChallengeView: View {
    
    @State var tabIndex = 0
    //var challenges: [Challenge] = getChallengeData()
    
    var body: some View {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        HStack(spacing: 16) {
                            HStack {
                                Text("Public")
                                    .foregroundColor(self.tabIndex == 0 ? Color.init(red:1.00, green:1.00, blue:1.00) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.32))
                            }
                            .padding(16)
                            .background(self.tabIndex == 0 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.06))
                            .cornerRadius(16)
                            .onTapGesture {
                                self.tabIndex = 0
                            }
                            
                            HStack {
                                Text("Local")
                                .foregroundColor(self.tabIndex == 1 ? Color.init(red:1.00, green:1.00, blue:1.00) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.32))
                            }
                            .padding(16)
                            .background(self.tabIndex == 1 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.06))
                            .cornerRadius(16)
                            .onTapGesture {
                                self.tabIndex = 1
                            }
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 16)
                        .padding(.leading, 16)
                        
                        if self.tabIndex == 0 {
                            VStack(alignment: .leading) {
                                Text("Hot")
                                    .font(.title)
                                    .padding(.leading, 16)
                                HotChallenges()
                            }
                            
                            VStack(alignment: .leading) {
                                Text("New")
                                    .font(.title)
                                    .padding(.leading, 16)
                                NewChallenges()
                            }
                            .offset(y: -80)
                        }
                        else if self.tabIndex == 1 {
                            Text("Munich, Germany")
                                .font(.title)
                                .padding(.leading, 16)
                            LocalChallenges()
                        }
                    }
                    
                }.navigationBarTitle(Text("Challenges"))
        }
    }
}

struct HotChallenges: View {
    
    var challenges: [Challenge] = getChallengeData()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(challenges) { item in
                    NavigationLink(destination: ChallengeDetailView(imageLoader: ImageLoader(urlString: item.image), challenge: item)) {
                       ChallengeCardView(challenge: item, imageLoader: ImageLoader(urlString: item.image))
                       .frame(width: 311)
                       .padding(.leading, 16)
                       .padding(.vertical, 48)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .offset(y: -48)
    }
}

struct NewChallenges: View {
    
    var challenges: [Challenge] = getChallengeData()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(challenges) { item in
                    NavigationLink(destination: ChallengeDetailView(imageLoader: ImageLoader(urlString: item.image), challenge: item)) {
                       ChallengeCardView(challenge: item, imageLoader: ImageLoader(urlString: item.image))
                       .frame(width: 311)
                       .padding(.leading, 16)
                       .padding(.vertical, 48)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .offset(y: -48)
    }
}

struct LocalChallenges: View {
    
    var challenges: [Challenge] = getChallengeData()
    
     var body: some View {
           ScrollView(.horizontal, showsIndicators: false) {
               HStack {
                   ForEach(challenges) { item in
                       NavigationLink(destination: ChallengeDetailView(imageLoader: ImageLoader(urlString: item.image), challenge: item)) {
                          ChallengeCardView(challenge: item, imageLoader: ImageLoader(urlString: item.image))
                          .frame(width: 311)
                          .padding(.leading, 16)
                          .padding(.vertical, 48)
                       }
                       .buttonStyle(PlainButtonStyle())
                   }
               }
           }
           .offset(y: -48)
       }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}


    

