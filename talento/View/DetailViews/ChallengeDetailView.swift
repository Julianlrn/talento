//
//  ChallengeDetailView.swift
//  talento
//
//  Created by Julian Lorenz on 12.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import SwiftUI

struct ChallengeDetailView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    @State var tabIndex = 0
    
    var challenge: Challenge
    
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: - TABS
            HStack(spacing: 16) {
                HStack {
                    Text("General")
                        .foregroundColor(self.tabIndex == 0 ? Color.init(red:1.00, green:1.00, blue:1.00) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.32))
                }
                .padding(16)
                .background(self.tabIndex == 0 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.06))
                .cornerRadius(16)
                .onTapGesture {
                    self.tabIndex = 0
                }
                
                HStack {
                    Text("Rating")
                    .foregroundColor(self.tabIndex == 1 ? Color.init(red:1.00, green:1.00, blue:1.00) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.32))
                }
                .padding(16)
                .background(self.tabIndex == 1 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.06))
                .cornerRadius(16)
                .onTapGesture {
                    self.tabIndex = 1
                }
                
                HStack {
                    Text("Ranking")
                    .foregroundColor(self.tabIndex == 2 ? Color.init(red:1.00, green:1.00, blue:1.00) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.32))
                }
                .padding(16)
                .background(self.tabIndex == 2 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.06))
                .cornerRadius(16)
                .onTapGesture {
                    self.tabIndex = 2
                }
            }
            .padding(.bottom, 8)
            .padding(.leading, 16)
            
            if self.tabIndex == 0 {
                General(challenge: self.challenge)
            }
            else if self.tabIndex == 1 {
                Rating(challenge: self.challenge)
            }
            else if self.tabIndex == 2 {
                Ranking(challenge: self.challenge)
            }
            
            Spacer()
        }
    }
}


struct General: View {
    
    var challenge: Challenge
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                 //MARK: - CARD
                 VStack {
                     //MARK: - IMAGE
                     Image(challenge.image)
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .overlay(
                         HStack {
                             Spacer()
                             //MARK: - HOT
                             VStack {
                                 Text("HOT")
                                     .font(.system(size: 12))
                                     .foregroundColor(Color.red)
                                     .padding(.trailing, 16)
                                     .padding(.leading, 16)
                                     .padding(.top, 8)
                                     .padding(.bottom, 8)
                                     .background(Color.white)
                                     .cornerRadius(16)
                                 Spacer()
                             }
                             .padding(.top, 16)
                             .padding(.trailing, 16)
                         }
                     )
                     .frame(maxHeight: 220)
                     
                     //MARK: - CONTENT
                     VStack(alignment: .leading, spacing: 24) {
                         
                         //MARK: - PARTICIPANTS
                         Text("Participants: \(challenge.participants)")
                             .font(.system(size: 16))
                             .padding(.top, 16)
                         
                         //MARK: - TITLE
                         Text(challenge.title)
                             .font(.system(size: 20, weight: .bold))
                         //MARK: - PROPERTIES
                         HStack {
                             HStack {
                                 Image(systemName: "globe")
                                 Text(challenge.visibility)
                             }
                             Spacer()
                             HStack {
                                 Image(systemName: "timer")
                                 Text("Time left: \(challenge.time/60/60) hours")
                             }
                             .padding(.trailing, 24)
                         }
                         .font(.footnote)
                         .foregroundColor(Color.gray)
                     }
                     .padding(.leading, 24)
                     .padding(.top, 12)
                     .padding(.bottom, 24)
                 }
                 .background(Color.white)
                 .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.12), radius: 1, x: 0, y: 1)
                 .padding(.bottom, 24)
                 
                 VStack(alignment: .leading, spacing: 16) {
                     Text("Author")
                         .font(.title)
                     HStack(spacing: 16) {
                         Image("profile")
                             .resizable()
                             .aspectRatio(contentMode: .fill)
                             .frame(width: 48, height: 48)
                             .clipShape(Circle())
                         Text("michael0301")
                             .font(.system(size: 20, weight: .bold))
                     }
                     .padding(.bottom, 16)
                     
                     Text("Instructions")
                         .font(.title)
                     Text(challenge.instructions)
                         .font(.system(size: 20))
                 }
                 .padding(.horizontal, 16)
             }
            .padding(.top, 16)
        }
    }
}

struct Rating: View {

    var challenge: Challenge

    var body: some View {
        EntryView()
    }
}

struct Ranking: View {

    var challenge: Challenge

    var body: some View {
        Text("This is Ranking!")
    }
}


/*struct ChallengeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDetailView(challenge: challengesData[0])
            //.previewLayout(.sizeThatFits)
    }
}*/
