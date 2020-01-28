//
//  ChallengeDetailView.swift
//  talento
//
//  Created by Julian Lorenz on 12.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase

struct ChallengeCardView: View {
    
    //MARK: - Properties
    
    var challenge: Challenge
    
    @State var isEnded : Bool = false
    
    @ObservedObject var imageLoader: ImageLoader
    
    var body: some View {
        VStack {
            //MARK: - IMAGE
            Image(uiImage: imageLoader.data != nil ? UIImage(data: imageLoader.data!)! : UIImage())
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 220)
            .clipShape(Rectangle())
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
            
            
            //MARK: - CONTENT
            VStack(alignment: .leading, spacing: 24) {
                
                //MARK: - PARTICIPANTS
                Text("Participants: \(challenge.participants.count)")
                    .font(.system(size: 16))
                
                //MARK: - TITLE
                Text(challenge.title)
                    .font(.system(size: 20, weight: .bold))
                //MARK: - PROPERTIES
                HStack {
                    HStack {
                        Image(systemName: "globe")
                        if challenge.isPublic ?? false {
                            Text("Public")
                        }
                        else { Text("Local") }
                    }
                    Spacer()
                    HStack {
                        //Text("Time left: \((challenge.timestamp.dateValue().calenderTimeSinceNow()))")
                        if challengeEnded() {
                            Text(getTimeLeft())
                                .foregroundColor(Color.red)
                        } else {
                            Image(systemName: "timer")
                            Text(getTimeLeft())
                        }
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
        .cornerRadius(16)
        .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24), radius: 24, x: 0, y: 12)
        .padding(.bottom, 24)
    }
    
    func challengeEnded() -> Bool {
        
        let createdTime = Date(ticks: UInt64(self.challenge.timestamp))
        let currentTime = Date()
        let durationTime = createdTime.addingTimeInterval(self.challenge.duration*60)
        
        if currentTime.isBetween(createdTime, durationTime) {
            return false
        } else {
            return true
        }
    }
    
    func getTimeLeft() -> String {
        
        //let createdTime = self.challenge.Date(tick: timestamp).dateValue()
        let createdTime = Date(ticks: UInt64(self.challenge.timestamp))
        let currentTime = Date()
        let durationTime = createdTime.addingTimeInterval(self.challenge.duration*60)
        
        let range = createdTime...durationTime
        
        if range.contains(currentTime) {
            return createdTime.timeLeftTo(durationTime)
        } else {
            return "Ended"
        }
    }
}



/*struct ChallengeCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCardView()
    }
}*/



    


