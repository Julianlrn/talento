//
//  GeneralView.swift
//  talento
//
//  Created by Gökay Inan on 21.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct GeneralView: View {
    
    var challenge: Challenge
    @ObservedObject var imageLoader: ImageLoader
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                 //MARK: - CARD
                 VStack {
                     //MARK: - IMAGE
                     Image(uiImage: imageLoader.data != nil ? UIImage(data: imageLoader.data!)! :UIImage())
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
                    
                    Button(action: {
                        print("Participate tapped!")
                    }) {
                        HStack {
                            Text("Participate")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color.white)
                                .padding(24)
                        }
                        .frame(width: 343)
                        .background(Color.init(red:0.96, green:0.11, blue:0.34))
                        .cornerRadius(16)
                        .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), radius: 8, x: 0, y: 4)
                        .padding(.bottom, 24)
                    }
                 }
                 .padding(.horizontal, 16)
             }
            .padding(.top, 16)
        }
    }
}
