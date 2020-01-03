//
//  ChallengeDetailView.swift
//  talento
//
//  Created by Julian Lorenz on 12.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import SwiftUI

struct ChallengeCardView: View {
    
    //MARK: - Properties
    
    var challenge: Challenge
    
    var body: some View {
        VStack {
            //Card Image
            Image(challenge.image)
            .resizable()
            .scaledToFit()
            .overlay(
                HStack {
                    Spacer()
                    //Hot Marker
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
            
            VStack(alignment: .leading, spacing: 24) {
                
                //PARTICIPANTS
                Text("Participants: \(challenge.participants)")
                
                //TITLE
                Text(challenge.title)
                    .font(.system(.title))
                //PROPERTIES
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
        .cornerRadius(16)
        .shadow(color: Color.gray, radius: 24, x: 0, y: 12)
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}

struct ChallengeCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCardView(challenge: challengesData[0])
            .previewLayout(.sizeThatFits)
    }
}


    


