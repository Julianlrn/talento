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
    
    @ObservedObject var imageLoader: ImageLoader
    
    var body: some View {
        ZStack {
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
                    Text("Participants: 123")
                        .font(.system(size: 16))
                    
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
            .cornerRadius(16)
            .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24), radius: 24, x: 0, y: 12)
            .padding(.bottom, 24)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

/*struct ChallengeCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCardView()
    }
}*/



    


