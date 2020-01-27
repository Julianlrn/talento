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
                Text("Participants: \(challenge.participants)")
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
                        Image(systemName: "timer")
                        Text("Created: \((challenge.timestamp.dateValue().calenderTimeSinceNow()))")
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
}



/*struct ChallengeCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCardView()
    }
}*/



    


